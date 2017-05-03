require 'rails_helper'

describe "Items API" do

  let(:date) {"2014-03-27T14:54:02.000Z"}

  context "find by" do
    let!(:item_1) { create(:item) }
    let!(:item_2) { create(:item, unit_price: 3544)}

    it "id" do
      id = item_1.id

      get '/api/v1/items/find', params:{ id: id }
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item['id']).to eq item_1.id
      expect(item['name']).to eq item_1.name
    end

    it "name" do
      name = item_1.name

      get '/api/v1/items/find', params:{ name: name }
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item['id']).to eq item_1.id
      expect(item['name']).to eq item_1.name

    end

    it "description" do
      description = item_2.description

      get '/api/v1/items/find', params:{ description: description }
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item['id']).to eq item_2.id
      expect(item['description']).to eq item_2.description
    end

    it "unit_price" do
      unit_price = item_2.unit_price / 100.to_f

      get '/api/v1/items/find', params:{ unit_price: unit_price }

      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item['id']).to eq item_2.id
      expect(item['price']).to eq (unit_price).to_s
    end

    it "merchant_id" do
      merchant_id = item_1.merchant_id

      get '/api/v1/items/find', params:{ merchant_id: merchant_id }
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item['id']).to eq item_1.id
      expect(item['merchant_id']).to eq item_1.merchant_id
    end

    it "created_at" do
      item_1.update(created_at: date)

      get '/api/v1/items/find', params:{ created_at: date }
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item['id']).to eq item_1.id
      expect(item['name']).to eq item_1.name
    end

    it "updated_at" do
      item_2.update(updated_at: date)

      get '/api/v1/items/find', params:{ updated_at: date }
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item['id']).to eq item_2.id
      expect(item['name']).to eq item_2.name
    end
  end

  context "find_all" do
    let!(:item_1) { create(:item, name: "coffee") }
    let!(:item_2) { create(:item, name: "coffee") }
    let!(:item_3) { create(:item) }

    it "name" do
      get '/api/v1/items/find_all', params:{ name: "coffee" }
      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.count).to eq 2
      items.each do |item|
        expect(item['name']).to eq "coffee"
      end
    end
  end
end
