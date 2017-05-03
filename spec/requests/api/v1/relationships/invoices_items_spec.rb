require 'rails_helper'

describe 'InvoiceItems API relationship' do
  let!(:merchant) { create(:merchant) }
  let!(:customer) { create(:customer) }
  let!(:invoice) { create(:invoice, customer: customer, merchant: merchant) }
  let!(:transaction) { create(:transaction, invoice: invoice) }
  let!(:item_1) { create(:item, merchant: merchant, description: "purple") }
  let!(:invoice_item) { create(:invoice_item, invoice: invoice, item: item_1, quantity: 5) }

  it 'invoice' do
    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"
    response_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_invoice["id"]).to eq invoice.id
  end

  it 'item' do
    get "/api/v1/invoice_items/#{invoice_item.id}/item"
    response_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_item["id"]).to eq item_1.id
  end


end
