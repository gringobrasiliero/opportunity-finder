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

it "has many users through applications" do
opportunity.users << [user, user_one]
expect(opportunity.users.first).to eq(user)
expect(opportunity.users.last).to eq(user_one)

end



end
