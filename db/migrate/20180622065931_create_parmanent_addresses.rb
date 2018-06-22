class CreateParmanentAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :parmanent_addresses do |t|

      t.timestamps
    end
  end
end
