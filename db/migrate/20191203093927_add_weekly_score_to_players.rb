class AddWeeklyScoreToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :weekly_score, :integer
  end
end
