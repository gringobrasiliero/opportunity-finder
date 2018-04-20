require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) {
    User.create(
      :email => "zurg@zurg.com",
      :password => "password",
      :opportunity_provider => false
    )
  }



  it "is valid with a name and password" do
     expect(user).to be_valid
   end

   it "is not valid without a password" do
       expect(User.new(email: "zurg@zurg.com")).not_to be_valid
     end

     it "is valid with an opportunity_provider boolean" do
   expect(opportunity_provider).to be_valid
 end

 it "defaults to opportunity_provider => false" do
     expect(user.opportunity_provider).to eq(false)
   end

it "has one profile" do
  profile = Profile.create(:user_id => user.id, :first_name => "Zurg", :last_name => "theDestroyer")
  expect(user.profile).to eq(profile)
end

it "has many opportunites" do
  first_op = Opportunity.create(:user_id => user.id, :title => "Defeat Buzz", :description => "Buzzzzzzzzzzzz")
  second_op = Opportunity.create(:user_id => user.id, :title => "Defeat Woody", :description => "Woodyyyyyyyy")
  expect(user.opportunities.first).to eq(first_op)
  expect(user.opportunities.last).to eq(second_op)
end
end
