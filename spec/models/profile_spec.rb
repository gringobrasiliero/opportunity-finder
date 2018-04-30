require 'rails_helper'

RSpec.describe Profile, type: :model do
  let(:profile) {
    Profile.create(
      :user_id => user.id,
      :first_name => "Zurg",
      :last_name => "theDestroyer"
    )
  }

  let(:user) {
    User.create(
      :email => "zurg@zurg.com",
      :password => "password",
    )
  }

  it "belongs to user" do
    expect(profile.user).to eq(user)
  end



end
