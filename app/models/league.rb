class League < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :participations
  has_many :participants, through: :participations
  has_many :teams

  MAX_PARTICIPANTS = 12

end
