require 'rails_helper'

describe "merchant API" do

  let(:date) {"2014-03-27T14:54:02.000Z"}

  context "find by" do
    let!(:merchant_1) { create(:merchant) }
    let!(:merchant_2) { create(:merchant) }

    it "id" do
      id = merchant_1.id

      get '/api/v1/merchants/find', params:{ id: id }
      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant['id']).to eq merchant_1.id
    end

    it "name" do
      name = merchant_1.name

      get '/api/v1/merchants/find', params:{ name: name }
      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant['name']).to eq merchant_1.name
    end

    it "created_at" do
      merchant_1.update(created_at: date)

      get '/api/v1/merchants/find', params:{ created_at: date }
      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant['name']).to eq merchant_1.name
    end

    it "updated_at" do
      merchant_2.update(updated_at: date)

      get '/api/v1/merchants/find', params:{ updated_at: date }
      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant['id']).to eq merchant_2.id
    end
  end
end
