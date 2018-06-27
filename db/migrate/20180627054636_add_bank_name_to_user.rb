class AddBankNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :bankname, :string
  end
end
