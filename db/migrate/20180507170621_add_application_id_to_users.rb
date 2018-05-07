class AddApplicationIdToUsers < ActiveRecord::Migration[5.1]
  def change
        add_column :users, :application_id, :integer
  end
end
