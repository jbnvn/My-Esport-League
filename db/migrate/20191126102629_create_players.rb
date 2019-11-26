class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :role
      t.integer :nationality
      t.decimal :minimum_bid
      t.string :pro_team

      t.timestamps
    end
  end
end
