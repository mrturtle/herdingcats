class AddDirectoryPreferenceToHousehold < ActiveRecord::Migration
  def change
    add_column :households, :show_information, :boolean
  end
end
