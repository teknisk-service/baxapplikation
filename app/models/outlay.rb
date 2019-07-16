class Outlay < ApplicationRecord
	has_many :debters, inverse_of: :outlay
	has_many :users, :through => :debters, :class_name => 'User'
	accepts_nested_attributes_for :users, :reject_if => :all_blank, :allow_destroy => true
	accepts_nested_attributes_for :debters, :reject_if => :all_blank, :allow_destroy => true
	after_create :set_team

	def debters
		Debter.all.where(outlay_id: self)
	end

	def user
		User.find_by(id: self.user_id).name
	end

	private
  	def set_team
    	team = SessionsController.helpers.current_team
    	update_attribute(:team_id, team.id)
  	end
end