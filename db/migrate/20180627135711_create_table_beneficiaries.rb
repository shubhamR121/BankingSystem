class CreateTableBeneficiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :beneficiaries do |t|
      t.string :name
      t.string :account_no
    end
  end
end
