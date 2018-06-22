class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|

      t.string :house_number, null: false, default: ""
      t.string :street_number, null: false, default: ""
      t.string :area, null: false, default: ""
      t.string :city, null: false, default: ""
      t.string :state, null: false, default: ""
      t.string :country, null: false, default: ""
      t.string :pin, null: false, default: ""
      t.string :address_proof, null: false, default: ""

      t.timestamps
    end
  end
end
