class Player < ApplicationRecord
  has_many :bids
  has_many :teams, through: :bids
  has_many :rounds

  # todo validation  uniqueness scope
  enum role: {
    top: 0,
    jun: 1,
    mid: 2,
    adc: 3,
    sup: 4
  }
  # doit rester identique au challenge#role

  enum nationality: {
    french: 0,
    american: 1,
    chinese: 2,
    korean: 3,
    german: 4,
    swedish: 5
  }

  def name
    lol_name
  end
end
