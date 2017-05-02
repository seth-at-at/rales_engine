require 'rails_helper'

describe "merchant API" do
  it "sends a list of merchants" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'
    expect(response).to be_success
    merchants = JSON.parse(response.body)

    expect(merchants.count).to eq(3)
  end

  it "can get one merchant id" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"
    merchant = JSON.parse(response.body)
    expect(merchant["id"]).to eq id
  end

  it "can create a new merhcant" do
    merchant_params = {name: "Banana"}

    post '/api/v1/merchants', params: { merchant: merchant_params }
    merchant = Merchant.last
    assert_response :success
    expect(response).to be_success
    expect(merchant.name).to eq merchant_params[:name]
  end

  it "update an existing merhcant" do
    id = create(:merchant).id

    previous_name = Merchant.last.name
    merchant_params = { name: "Christopherson" }

    put "/api/v1/merchants/#{id}", params: { merchant: merchant_params }
    merchant = Merchant.find_by(id: id)
    expect(response).to be_success
    expect(merchant.name).to_not eq previous_name
    expect(merchant.name).to eq "Christopherson"
  end

  it "can destroy an merchant" do
    merchant = create(:merchant)

    expect(Merchant.count).to eq 1

    delete "/api/v1/merchants/#{merchant.id}"
    expect(response).to be_success
    expect(Merchant.count).to eq 0
    expect{ Merchant.find(merchant.id) }.to raise_error(ActiveRecord::RecordNotFound)
  end

  it "can destroy an merchant" do
    id = create(:merchant).id

    expect{delete "/api/v1/merchants/#{id}"}.to change(Merchant, :count).by(-1)
    expect(response).to be_success
    expect{ Merchant.find(id) }.to raise_error(ActiveRecord::RecordNotFound)

  end
end
