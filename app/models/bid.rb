class Bid < ApplicationRecord
  belongs_to :player
  belongs_to :team

  enum status: {
    pending: 0,
    succeeded: 1,
    failed: 2,
  }
end
