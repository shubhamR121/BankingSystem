class AddBalanceToAccount < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :balance, :float
  end
end
