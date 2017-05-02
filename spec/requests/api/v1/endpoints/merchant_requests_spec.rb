require 'rails_helper'

describe "merchant API" do
  it "sends a list of merchants" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'
    expect(response).to be_success
    merchants = JSON.parse(response.body)

    expect(merchants.count).to eq(3)
  end

  xit "can get one merchant id" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"
    merchant = JSON.parse(response.body)
    expect(merchant["id"]).to eq id
  end
end
