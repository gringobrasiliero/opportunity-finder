require 'rails_helper'

RSpec.describe Opportunity, type: :model do
  let(:opportunity) {
    Opportunity.create(
      :user_id => user.id,
      :title => "Defeat Buzz",
      :description => "Buzzzzzzzzzzzz",
      :id => 1
    )
  }

  let(:user) {
    User.create(
      :email => "zurg@zurg.com",
      :password => "password",
      :id => 1

    )
  }
  let(:user_one) {
    User.create(
      :email => "darth@vader.com",
      :password => "password",
      :id => 2
    )
  }

  let(:application) {
    Application.create(
    :id => 1,
    :user_id => user.id,
    :opportunity_id => opportunity.id,
    :qualified => true,
    :legal => false,
    :month_commitment => 6,
    :reason_for_interest => "Defeat him",
    :criminal_record => true,
    :description_of_criminal_record => "N/A",
    :transportation => true

    )
  }


it "belongs to user" do
  expect(opportunity.user).to eq(user)
end

it "has many applications" do
  first_app = Application.create( :opportunity_id => opportunity.id, :user_id => user.id, :qualified => true, :legal => false, :month_commitment => 6, :reason_for_interest => "Defeat him", :transportation => true, :criminal_record => false, :description_of_criminal_record => false)
  second_app = Application.create( :opportunity_id => opportunity.id, :user_id => user.id, :qualified => false, :legal => true, :month_commitment => 1, :reason_for_interest => "Defeat him fast", :transportation => true, :criminal_record => false, :description_of_criminal_record => false)
   expect(opportunity.applications.first).to eq(first_app)
  expect(opportunity.applications.last).to eq(second_app)
end

end
