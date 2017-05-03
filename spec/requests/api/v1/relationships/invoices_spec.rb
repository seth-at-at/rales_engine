require 'rails_helper'

describe 'Invoice API relationship' do
  let!(:merchant) { create(:merchant) }
  let!(:customer) { create(:customer) }
  let!(:invoice) { create(:invoice, customer: customer, merchant: merchant) }
  let!(:transaction) { create(:transaction, invoice: invoice) }
  let!(:item_1) { create(:item, merchant: merchant, description: "fuzzy") }
  let!(:item_2) { create(:item, merchant: merchant, description: "fuzzy") }
  let!(:invoice_item_1) { create(:invoice_item, invoice: invoice, item: item_1, quantity: 5) }
  let!(:invoice_item_2) { create(:invoice_item, invoice: invoice, item: item_2, quantity: 5) }

  xit 'invoice_items' do
    get "/api/v1/invoices/#{invoice.id}/invoice_items"
    response_invoice_items = JSON.parse(response.body)

    expect(response).to be_success
    response_invoice_items.each do |invoice_item|
      expect(invoice_item['quantity']).to eq 5
    end
  end

  xit 'items' do
    get "/api/v1/invoices/#{invoice.id}/items"
    response_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(response_items).to be_a Array
    expect(response_items.first).to be_a Hash
    response_items.each do |item|
      expect(item['description']).to eq "purple"
    end
  end
end
