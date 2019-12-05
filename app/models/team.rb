class Team < ApplicationRecord
  belongs_to :user
  belongs_to :league

  has_many :weekly_scores, dependent: :destroy
  has_many :bids, dependent: :destroy
  has_many :players, through: :bids

  def compute_points
    points = self.victory_count * 3
    points += self.draw_count
    return points
  end
end
