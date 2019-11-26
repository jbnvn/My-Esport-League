class CreateRoundChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :round_challenges do |t|
      t.integer :state, default: 0, null: false
      t.references :round, foreign_key: true
      t.references :challenge, foreign_key: true

      t.timestamps
    end
  end
end
