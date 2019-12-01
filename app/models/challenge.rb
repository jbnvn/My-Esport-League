class Challenge < ApplicationRecord
  has_many :round_challenges
  has_many :rounds, through: :round_challenges

  enum role: {
    top: 0,
    jun: 1,
    mid: 2,
    adc: 3,
    sup: 4
  }
# doit rester identique au player#role
end
