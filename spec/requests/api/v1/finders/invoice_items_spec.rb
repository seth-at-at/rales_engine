require 'rails_helper'

describe "Ivoice_item API" do

  let(:date) {"2014-03-27T14:54:02.000Z"}

  context "find by" do
    let!(:invoice_item_1) { create(:invoice_item) }
    let!(:invoice_item_2) { create(:invoice_item) }

    it "id" do
      id = invoice_item_1.id

      get '/api/v1/invoice_items/find', params:{ id: id }
      invoice_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_item['id']).to eq invoice_item_1.id
    end

    it "invoice_id" do
      invoice_id = invoice_item_2.invoice_id

      get '/api/v1/invoice_items/find', params:{ invoice_id: invoice_id }
      invoice_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_item['id']).to eq invoice_item_2.id
      expect(invoice_item['invoice_id']).to eq invoice_item_2.invoice_id
    end

    it "item_id" do
      item_id = invoice_item_2.item_id

      get '/api/v1/invoice_items/find', params:{ item_id: item_id }
      invoice_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_item['id']).to eq invoice_item_2.id
      expect(invoice_item['item_id']).to eq invoice_item_2.item_id
    end

    it "quantity" do
      quantity = invoice_item_1.quantity

      get '/api/v1/invoice_items/find', params:{ quantity: quantity }
      invoice_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_item['id']).to eq invoice_item_1.id
      expect(invoice_item['quantity']).to eq invoice_item_1.quantity
    end

    it "unit_price" do
      unit_price = invoice_item_2.unit_price / 100.to_f

      get '/api/v1/invoice_items/find', params:{ unit_price: unit_price }
      invoice_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_item['id']).to eq invoice_item_2.id
      expect(invoice_item['price']).to eq (unit_price).to_s
    end

    it "created_at" do
      invoice_item_1.update(created_at: date)

      get '/api/v1/invoice_items/find', params:{ created_at: date }
      invoice_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_item['id']).to eq invoice_item_1.id
      expect(invoice_item['invoice_id']).to eq invoice_item_1.invoice_id
    end

    it "updated_at" do
      invoice_item_2.update(updated_at: date)

      get '/api/v1/invoice_items/find', params:{ updated_at: date }
      invoice_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_item['id']).to eq invoice_item_2.id
      expect(invoice_item['invoice_id']).to eq invoice_item_2.invoice_id
    end
  end
end
