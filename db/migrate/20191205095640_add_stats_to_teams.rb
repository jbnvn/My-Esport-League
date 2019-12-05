class AddStatsToTeams < ActiveRecord::Migration[5.2]
  def change
   add_column :teams, :victory_count, :integer
   add_column :teams, :draw_count, :integer
   add_column :teams, :defeat_count, :integer
  end
end
