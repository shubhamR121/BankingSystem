class AddOtpToAccount < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :opt, :string
  end
end
