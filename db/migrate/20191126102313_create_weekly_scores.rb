class CreateWeeklyScores < ActiveRecord::Migration[5.2]
  def change
    create_table :weekly_scores do |t|
      t.decimal :score
      t.date :date
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
