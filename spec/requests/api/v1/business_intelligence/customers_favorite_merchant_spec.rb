require 'rails_helper'

describe "retrieving revenue from merchants" do
  let!(:merchant) { create(:merchant) }
  let!(:customer_1) { create(:customer) }
  let!(:customer_2) { create(:customer) }
  let!(:invoice) { create(:invoice, customer: customer_1, merchant: merchant) }
  let!(:invoice2) { create(:invoice, customer: customer_1, merchant: merchant) }
  let!(:transaction) { create(:transaction, invoice: invoice) }
  # let!(:item_1) { create(:item, merchant: merchant, unit_price: 300) }
  # let!(:item_2) { create(:item, merchant: merchant, unit_price: 100) }
  # let!(:invoice_item_1) { create(:invoice_item, invoice: invoice, item: item_1, created_at: "2012-03-16", unit_price: 300, quantity: 1) }
  # let!(:invoice_item_3) { create(:invoice_item, invoice: invoice, item: item_1, created_at: "2012-03-16", unit_price: 250, quantity: 2) }
  # let!(:invoice_item_2) { create(:invoice_item, invoice: invoice2, item: item_2, created_at: "2012-03-16", unit_price: 100, quantity: 5) }

  it "gets a customers favorite merchant" do
    get "/api/v1/customers/#{customer_1.id}/favorite_merchant"
    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq merchant.id
  end
end
