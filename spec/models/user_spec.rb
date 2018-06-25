require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) {
    User.create(
      :email => "zurg@zurg.com",
      :password => "password",
      :id => 1,


    )
  }

  let(:opportunity) {
    Opportunity.create(
      :user_id => user.id,
      :title => "Defeat Buzz",
      :description => "Buzzzzzzzzzzzz",
      :id => 1
    )
  }



  let(:app_one) {
    Application.create(
    :id => 1,
    :user_id => user.id,
    :opportunity_id => opportunity.id,
    :qualified => true,
    :legal => false,
    :month_commitment => 6,
    :reason_for_interest => "Defeat him",
    :criminal_record => true,
    :description_of_criminal_record => "N/A"


    )
  }

  let(:app_two) {
    Application.create(
    :id => 2,
    :user_id => user.id,
    :opportunity_id => opportunity.id,
    :qualified => false,
    :legal => true,
    :month_commitment => 6,
    :reason_for_interest => "Defeat him nowwww",
    :criminal_record => true,
    :description_of_criminal_record => "N/A"
    )
  }

  it "is valid with a name and password" do
     expect(user).to be_valid
   end

   it "is not valid without a password" do
       expect(User.new(email: "zurg@zurg.com")).not_to be_valid
     end



 it "defaults to opportunity_provider => false" do
     expect(user.opportunity_provider).to eq(false)
   end

it "has one profile" do
  profile = user.build_profile(profile)
  expect(user.profile).to eq(profile)
end





it "has many opportunites" do
  first_op = Opportunity.create(:user_id => user.id, :title => "Defeat Buzz", :description => "Buzzzzzzzzzzzz")
  second_op = Opportunity.create(:user_id => user.id, :title => "Defeat Woody", :description => "Woodyyyyyyyy")
  expect(user.opportunities.first).to eq(first_op)
  expect(user.opportunities.last).to eq(second_op)
end

it "has many applications" do
application = Application.create
user.applications << application
user.save

   expect(user.applications.first).to eq(application)



  end






end
