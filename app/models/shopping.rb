class Shopping < ApplicationRecord
	validates :sum, presence: true
  	validates :description, presence: true
  	validates :mammerist, presence: true

	has_many :products
end
