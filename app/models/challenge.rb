class Challenge < ApplicationRecord
  has_many :round_challenges
  has_many :rounds, through: :round_challenges

  enum role: {
    top: 0,
    jungle: 1,
    mid: 2,
    adc: 3,
    support: 4
  }
# doit rester identique au player#role
end
