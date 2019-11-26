class RoundChallenge < ApplicationRecord
  belongs_to :round
  belongs_to :challenge

  enum state: {
    pending: 0,
    pass: 1,
    fail: 2
  }
end
