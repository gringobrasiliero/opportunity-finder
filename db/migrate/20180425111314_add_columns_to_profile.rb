class AddColumnsToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :business_name, :string

  end
end
