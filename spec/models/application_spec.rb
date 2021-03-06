require 'rails_helper'

RSpec.describe Application, type: :model do
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
    :description_of_criminal_record => "N/A"


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
    expect(application.user).to eq(user)
  end

  it "belongs to opportunity" do
    expect(application.opportunity).to eq(opportunity)
  end

end
