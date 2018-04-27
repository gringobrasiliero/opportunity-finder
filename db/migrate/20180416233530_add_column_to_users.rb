class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
     t.boolean :opportunity_provider, :default => false
     t.string :uid
     t.string :provider
     t.string :positions
   end
  end
end
