class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :company_name
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :cif
      t.string :email

      t.timestamps
    end
  end
end
