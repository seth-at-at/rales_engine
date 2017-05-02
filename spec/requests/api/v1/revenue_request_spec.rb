require 'rails_helper'

describe "retrieving revenue from merchants" do
  xit "shows total revenue for a specific merchant" do
    merchant = create(:merchant)

    get '/api/v1/merchants/:id/revenue'
    expect(response).to be_success
    expect(merchant["revenue"]).to eq(100)
  end
end
