class League < ApplicationRecord
  belongs_to :user
  has_many :users, through: :participations
end
