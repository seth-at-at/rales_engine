require 'rails_helper'

describe "Items API" do

  let(:date) {"2014-03-27T14:54:02.000Z"}

  context "find by" do
    let!(:item_1) { create(:item)}

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
  end
end
