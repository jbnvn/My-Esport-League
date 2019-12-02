class League < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :participations, dependent: :destroy
  has_many :participants, through: :participations
  has_many :teams, dependent: :destroy
  has_many :bids, through: :teams
  has_many :players, through: :teams
  MAX_PARTICIPANTS = 12

end
