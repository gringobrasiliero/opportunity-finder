class AddColumnToApplications < ActiveRecord::Migration[5.1]
  def change_table
   add_column :applications, :created_at, :datetime, null: false
   add_column :applications, :updated_at, :datetime, null: false
 end
  end
