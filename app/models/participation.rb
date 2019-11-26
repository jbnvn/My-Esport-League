class Participation < ApplicationRecord
  belongs_to :participant, class_name: 'User', foreign_key: 'user_id'
  belongs_to :joined_league, class_name: 'League', foreign_key: 'league_id'
end
