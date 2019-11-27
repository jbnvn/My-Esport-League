class AddColumnsToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :first_name, :string
    add_column :players, :last_name, :string
    add_column :players, :lol_name, :string
    add_column :players, :lol_id, :integer
    add_column :players, :country, :string
    add_column :players, :image_url, :string
    add_column :players, :role_string, :string

    add_column :players, :pro_team_id,:integer
    add_column :players, :pro_team_acronym, :string
    add_column :players, :pro_team_image_url, :string
    rename_column :players, :pro_team, :pro_team_name

    add_column :players, :current_videogame_name, :string

  end
end
