class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :applications do |t|
      t.boolean :qualified
      t.boolean :legal
      t.integer :month_commitment
      t.string :reason_for_interest
      t.integer :user_id
      t.integer :opportunity_id
    end
  end
end
