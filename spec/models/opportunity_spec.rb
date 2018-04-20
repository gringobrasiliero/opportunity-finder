require 'rails_helper'

RSpec.describe Opportunity, type: :model do
  let(:opportunity) {
    Opportunity.create(
      :user_id => user.id,
      :title => "Defeat Buzz",
      :description => "Buzzzzzzzzzzzz"
    )
  }

  let(:user) {
    User.create(
      :email => "zurg@zurg.com",
      :password => "password",

    )
  }
  let(:user_one) {
    User.create(
      :email => "darth@vader.com",
      :password => "password",

    )
  }

it "belongs to user" do
  expect(opportunity.user).to eq(user)
end

it "has many applications" do
  first_app = Application.create( :user_id => user.id, :qualified => true, :legal => false, :month_commitment => 6, :reason_for_interest => "Defeat him")
  second_app = Application.create( :user_id => user.id, :qualified => false, :legal => true, :month_commitment => 1, :reason_for_interest => "Defeat him fast")
   expect(opportunity.applications.first).to eq(first_app)
  expect(opportunity.applications.last).to eq(second_app)
end



it "has many users through applications" do
opportunity.users << [user, user_one]
expect(opportunity.users.first).to eq(user)
expect(opportunity.users.last).to eq(user_one)

end



end
