class CreateOpportunities < ActiveRecord::Migration[5.1]
  def change
    create_table :opportunities do |t|
    t.string :description
    t.string :title
    t.belongs_to :user, index:true, foreign_key:true
    t.timestamps
    end
  end
end
