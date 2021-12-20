class CreateDeliverables < ActiveRecord::Migration[6.1]
  def change
    create_table :deliverables do |t|
      t.string :title
      t.integer :price, default: 0
      t.integer :time_alocation

      t.timestamps
    end
  end
end
