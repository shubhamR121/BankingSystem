class CreateJoinTableBeneficiariesUsers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :beneficiaries, :users do |t|
      # t.index [:beneficiary_id, :user_id]
      # t.index [:user_id, :beneficiary_id]
    end
  end
end
