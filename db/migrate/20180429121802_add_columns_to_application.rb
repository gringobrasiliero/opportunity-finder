class AddColumnsToApplication < ActiveRecord::Migration[5.1]
  def change
change_table :applications do |t|
    t.boolean :transportation
    t.boolean :criminal_record
    t.text :description_of_criminal_record
  end
end
end
