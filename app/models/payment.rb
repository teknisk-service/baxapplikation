class Payment < ApplicationRecord
  belongs_to :user

  def total_in
  	Payment.sum(:amount)
  end

end
