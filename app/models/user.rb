class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :leagues
  has_many :participations
  has_many :joined_leagues, through: :participations
  has_many :teams
  validates :username, presence: true

  # CLOUDINARY
  has_one_attached :photo
end
