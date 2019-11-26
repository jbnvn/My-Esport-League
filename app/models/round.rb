class Round < ApplicationRecord
  belongs_to :player
  has_many :round_challenges
  has_many :challenges, through: :round_challenges
end
