class Team < ApplicationRecord
  belongs_to :user
  belongs_to :league

  has_many :weekly_scores, dependent: :destroy
  has_many :bids, dependent: :destroy
  has_many :players, through: :bids
end
