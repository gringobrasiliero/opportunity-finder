class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user
      t.string :first_name
      t.string :last_name
      t.string :location
      t.string :picture_url
      t.string :profession
      t.string :uid
      t.string :provider
      t.string :email
      t.timestamps
    end
  end
end
