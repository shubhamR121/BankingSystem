class CreateLocalAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :local_addresses do |t|

      t.timestamps
    end
  end
end
