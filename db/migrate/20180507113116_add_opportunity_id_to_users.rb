class AddOpportunityIdToUsers < ActiveRecord::Migration[5.1]
  def change

    add_column :users, :opportunity_id, :integer
  end
end
