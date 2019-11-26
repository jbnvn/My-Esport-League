class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.string :name
      t.text :description
      t.integer :bonus
      t.integer :malus
      t.integer :role

      t.timestamps
    end
  end
end
