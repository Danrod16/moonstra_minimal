class AddStatusToProposals < ActiveRecord::Migration[6.1]
  def change
    add_column :proposals, :status, :string
  end
end
