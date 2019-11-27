class Team < ApplicationRecord
  belongs_to :user
  belongs_to :league
  has_many :weekly_scores, dependent: :delete_all
  has_many :bids, dependent: :delete_all
  has_many :players, through: :bids
end
