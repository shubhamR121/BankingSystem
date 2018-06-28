class AddUserIdToBeneficiary < ActiveRecord::Migration[5.2]
  def change
    add_column :beneficiaries, :user_id, :string
  end
end
