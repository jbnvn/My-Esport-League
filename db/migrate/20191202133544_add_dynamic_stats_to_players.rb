class AddDynamicStatsToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :kda,:float
    add_column :players, :win_rate,:float
    add_column :players, :creep_score_per_minute,:float
    add_column :players, :kill_participation,:float
    add_column :players, :kill_share,:float
    add_column :players, :gold_share,:float
  end
end


