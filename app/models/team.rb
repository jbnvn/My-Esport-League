class Team < ApplicationRecord
  belongs_to :user
  belongs_to :league
  has_many :weekly_scores
  has_many :bids
  has_many :players, through: :bids
end
