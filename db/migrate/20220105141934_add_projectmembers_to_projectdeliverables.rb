class AddProjectmembersToProjectdeliverables < ActiveRecord::Migration[6.1]
  def change
    add_reference :proposal_deliverables, :project_members, null: false, foreign_key: true
  end
end
