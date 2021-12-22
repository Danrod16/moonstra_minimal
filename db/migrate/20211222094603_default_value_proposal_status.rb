class DefaultValueProposalStatus < ActiveRecord::Migration[6.1]
  def change
    change_column_default :proposals, :status, "pending"
  end
end
