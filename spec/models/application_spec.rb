require 'rails_helper'

RSpec.describe Application, type: :model do
  let(:application) {
    Application.create(
    :user_id => user.id,
    :qualified => true,
    :legal => false,
    :month_commitment => 6,
    :reason_for_interest => "Defeat him"
    )
  }

  let(:user) {
    User.create(
      :email => "zurg@zurg.com",
      :password => "password",
      
    )
  }

  let(:opportunity) {
    Opportunity.create(
      :user_id => user.id,
      :title => "Defeat Buzz",
      :description => "Buzzzzzzzzzzzz"
    )
  }

  it "belongs to user" do
    expect(application.users).to eq(user)
  end

  it "belongs to opportunities" do
    expect(application.opportunities).to eq(opportunity)
  end

end
