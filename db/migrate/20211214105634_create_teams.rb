class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :primary_color
      t.text :description
      t.text :terms_and_conditions
      t.string :banner

      t.timestamps
    end
  end
end
