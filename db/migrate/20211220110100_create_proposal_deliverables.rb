class CreateProposalDeliverables < ActiveRecord::Migration[6.1]
  def change
    create_table :proposal_deliverables do |t|
      t.references :deliverable, null: false, foreign_key: true
      t.references :proposal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
