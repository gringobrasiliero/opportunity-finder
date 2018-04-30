class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :location
      t.string :picture_url
      t.string :profession
      t.string :uid
      t.string :provider
      t.string :email
      t.string :business_name
      t.string :positions
      t.timestamps
    end
  end
end
