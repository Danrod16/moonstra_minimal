class CreateProjectCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :project_categories do |t|
      t.references :category
      t.references :project

      t.timestamps
    end
  end
end
