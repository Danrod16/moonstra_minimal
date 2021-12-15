class AddDiamondsToTeams < ActiveRecord::Migration[6.1]
  def change
    add_column :teams, :diamonds, :integer, default: 0
  end
end
