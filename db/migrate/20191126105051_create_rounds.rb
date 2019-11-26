class CreateRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :rounds do |t|
      t.date :date
      t.decimal :kda
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
