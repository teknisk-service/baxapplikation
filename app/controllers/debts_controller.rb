class DebtsController < ApplicationController
  def new
  	@debts = Debt.new
  end

  def pay
  end

  def show
  end 

  def index 
  	@debts = Debt.all
  end
end
