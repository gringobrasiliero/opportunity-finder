class AddColumnsToApplications < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :users, :belongs_to,  index: true
    add_column :applications, :opportunities, :belongs_to, index: true
  end
end
