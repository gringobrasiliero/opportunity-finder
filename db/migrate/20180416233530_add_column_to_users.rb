class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
     t.boolean :opportunity_provider, :default => false
   end
  end
end
