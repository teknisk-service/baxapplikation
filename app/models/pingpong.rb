class Pingpong < ApplicationRecord
    validates :winner, presence: true
    validates :looser, presence: true
    validates :sets_p1, presence: true
    validates :sets_p2, presence: true
    belongs_to :user

    def winning_user
        User.find_by_id(self.winner)
    end

     def loosing_user
        User.find_by_id( self.looser)
    end
end
