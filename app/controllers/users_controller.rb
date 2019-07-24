class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :authorize, :purchases]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :authorize, only: [:edit, :update, :purchases]

  def index
    team = SessionsController.helpers.current_team
    @users = User.where('teams && ARRAY[?]::varchar[]', [team.id]).sort_by(&:debt).reverse
  end

  def show
  end

  def toplists
    team = SessionsController.helpers.current_team
    active = User.where('teams && ARRAY[?]::varchar[]', [team.id])
    @baxbollar = active.sort_by(&:baxbollar).reverse
    @alkohol = active.all.sort_by(&:alcohol).reverse
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    whitelist = Whitelist.select("email")
    if !whitelist.exists?(email: params[:user][:email].downcase)
      flash[:error] = "Du har inte tillåtelse att registrera dig"
      render 'new'
    elsif @user.save
      log_in @user
      flash[:success] = "Välkommen till baxapplikationen!"
      redirect_to @user
    elsif User.exists?(email: params[:user][:email].downcase)
      flash[:error] = "Det finns redan ett konto med den epostadressen"
      render 'new'
    else
      flash[:error] = "Något gick fel. Försök igen!"
      render 'new'
    end
  end

  def edit
    head :forbidden unless authorize
  end

  def update
    head :forbidden unless authorize
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def purchases
    if authorize
      @purchases = @user.purchases
      purchases_grouped
      render 'purchases'
    else
      flash[:notice] = "Det där får du inte se!"
      redirect_to root_path
    end
  end

  def purchases_grouped
    @purchases_grouped = @user.purchases_grouped
  end

  def set_admin
    @user = User.find(params[:id])
    @user.update_attribute :admin, true
    flash[:success] = "Användaren är nu admin"
  end

  def remove_admin
    @user = User.find(params[:id])
    @user.update_attribute :admin, false
    flash[:success] = "Användaren inte längre admin"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def authorize
      current_user?(@user) || current_user.admin?
    end
end
