class AddStats3ToTeams < ActiveRecord::Migration[5.2]
  def change
   change_column :teams, :victory_count, :integer
   change_column :teams, :draw_count, :integer
   change_column :teams, :defeat_count, :integer
  end
end

