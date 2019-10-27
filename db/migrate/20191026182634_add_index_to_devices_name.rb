class AddIndexToDevicesName < ActiveRecord::Migration[5.2]
  def change
	  add_index :devices, :name, unique: true
  end
end
