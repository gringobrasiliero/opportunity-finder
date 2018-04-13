class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :location
      t.string :picture_url
      t.string :profession
end
  end
end
