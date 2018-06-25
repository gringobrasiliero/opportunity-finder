require 'rails_helper'

RSpec.describe OpportunitiesController, type: :controller do
  before do
    Opportunity.destroy_all
        @opportunity_attributes = {description: "Test", title: "Testing", user_id: 12, id: 2}
  end

  describe "POST create" do
    it 'creates a new opportunity' do
      Opportunity.create(@opportunity_attributes)
      expect(response).to redirect_to(opportunities_path)
      expect(Opportunity.count).to eq 1
  end
  end

  describe "GET show" do
  it 'returns a JSON representation of the opportunity' do
    opportunity = Opportunity.create(@opportunity_attributes)

    get :show, params: {id: opportunity.id, format: 'json'}
    body = JSON.parse(response.body)
    expect(body["title"]).to eq opportunity.title
    expect(body["description"]).to eq opportunity.description

    expect(body["user_id"]).to eq opportunity.user_id


  end
end
end
