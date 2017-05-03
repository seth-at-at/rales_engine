require 'rails_helper'

describe "Ivoice API" do

  let(:date) {"2014-03-27T14:54:02.000Z"}

  context "find by" do
    let!(:invoice_1) { create(:invoice) }
    let!(:invoice_2) { create(:invoice) }

    it "id" do
      id = invoice_1.id

      get '/api/v1/invoices/find', params:{ id: id }
      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice['id']).to eq invoice_1.id
      expect(invoice['customer_id']).to eq invoice_1.customer_id
    end

    it "customer_id" do
      customer_id = invoice_2.customer_id

      get '/api/v1/invoices/find', params:{ customer_id: customer_id }
      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice['id']).to eq invoice_2.id
      expect(invoice['customer_id']).to eq invoice_2.customer_id

    end

    it "merchant_id" do
      merchant_id = invoice_2.merchant_id

      get '/api/v1/invoices/find', params:{ merchant_id: merchant_id }
      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice['id']).to eq invoice_2.id
      expect(invoice['merchant_id']).to eq invoice_2.merchant_id
    end

    it "status" do
      status = invoice_1.status

      get '/api/v1/invoices/find', params:{ status: status }
      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice['id']).to eq invoice_1.id
      expect(invoice['status']).to eq invoice_1.status
    end

    it "created_at" do
      invoice_1.update(created_at: date)

      get '/api/v1/invoices/find', params:{ created_at: date }
      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice['id']).to eq invoice_1.id
      expect(invoice['customer_id']).to eq invoice_1.customer_id
    end

    it "updated_at" do
      invoice_2.update(updated_at: date)

      get '/api/v1/invoices/find', params:{ updated_at: date }
      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice['id']).to eq invoice_2.id
      expect(invoice['customer_id']).to eq invoice_2.customer_id
    end
  end
end
