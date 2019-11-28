class League < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :participations, dependent: :destroy
  has_many :participants, through: :participations
  has_many :teams, dependent: :destroy
  MAX_PARTICIPANTS = 12

end
