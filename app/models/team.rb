class Team < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :league, dependent: :destroy

  has_many :weekly_scores, dependent: :destroy
  has_many :bids, dependent: :destroy
  has_many :players, through: :bids

    # CLOUDINARY
  has_one_attached :photo
  validates :photo, presence: true
  validates :name, presence: true

  def compute_points
    points = self.victory_count * 3
    points += self.draw_count
    return points
  end
end
