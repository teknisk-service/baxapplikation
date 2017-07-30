class Debter < ApplicationRecord
	belongs_to :outlay
	belongs_to :user
	accepts_nested_attributes_for :user, :reject_if => :all_blank

	def payed_text 
		return 'Ja' if self.payed == true
		return 'Nej' if self.payed == false 
	end
end
