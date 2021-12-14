class CreateTeamsProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :teams_projects do |t|
      t.string :status, default: "pending"
      t.references :team, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
