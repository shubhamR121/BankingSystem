class CreateBanknames < ActiveRecord::Migration[5.2]
  def change
    create_table :banknames do |t|
      t.string :name

      t.timestamps
    end
  end
end
