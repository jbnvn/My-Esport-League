class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.decimal :global_score, precision: 12, scale: 2
      t.references :user, foreign_key: true
      t.references :league, foreign_key: true

      t.timestamps
    end
  end
end
