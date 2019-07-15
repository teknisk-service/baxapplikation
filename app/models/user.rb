class User < ApplicationRecord
  attr_accessor :remember_token
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  has_many :purchases, dependent: :destroy
  has_many :payments, dependent: :destroy

  has_many :outlays, through: :debters
  has_many :debters, inverse_of: :user

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  def debt
    Purchase.where(user: self).includes(:product).sum(:price) + debt_per_drifter
  end

  def debt_per_drifter
    (SharedPurchase.all.sum(:price).to_f/9).ceil
  end

  def payed
    Payment.where(user: self).sum(:amount)
  end

  def total
    debt-payed
  end

  def admin?
    self.admin
  end

  def purchases
    Purchase.where(user: self).sort_by(&:created_at).reverse
  end

  def purchases_grouped
    purchases.group_by(&:product).to_h
  end

  def baxbollar
    baxboll = Product.select("id").where(name: "Baxboll")
    Purchase.where(product_id: baxboll).where(user: self).count #får hårdkodas för tillfället
  end

  def alcohol
    alcId = Product.select("id").where(alcohol: true)
    Purchase.where(product_id: alcId).where(user: self).count
  end

  def payments
    Payment.where(user: self)
  end

  def set_admin
    update_attribute(:admin, true)
  end

  def whitelisted
    whitelist = Whitelist.select("email")
    if whitelist.exists?(:email => params[:user][:email].downcase)
      return true
    else
      return false
    end
  end

  def delete_purchases
    Purchase.where(user: self).destroy_all
  end

  def pingpong_won
    Pingpong.where(winner: self).count
  end

  def pingpong_lost
    Pingpong.where(looser: self).count
  end

  def pingpong_score
    self.pingpong_won-self.pingpong_lost
  end

  def set_team(id)
    new_team = self.teams.push(id)
    update_attribute(:teams, new_team)
  end
end
