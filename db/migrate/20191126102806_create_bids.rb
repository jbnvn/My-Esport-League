class CreateBids < ActiveRecord::Migration[5.2]
  def change
    create_table :bids do |t|
      t.integer :status
      t.decimal :points
      t.references :player, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
