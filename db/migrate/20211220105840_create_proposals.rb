class CreateProposals < ActiveRecord::Migration[6.1]
  def change
    create_table :proposals do |t|
      t.string :title
      t.text :overview
      t.text :goals
      t.integer :total_price, default: 0
      t.date :expiry_date
      t.references :client, null: false, foreign_key: true
      t.references :teams_project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
