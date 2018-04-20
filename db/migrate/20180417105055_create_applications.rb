class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :applications do |t|
      t.boolean :qualified
      t.boolean :legal
      t.integer :month_commitment
      t.string :reason_for_interest
      t.belongs_to :user, index: true
      t.belongs_to :opportunity, index: true

    end
  end
end
