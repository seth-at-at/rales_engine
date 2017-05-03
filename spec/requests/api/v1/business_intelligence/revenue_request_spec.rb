require 'rails_helper'

describe "retrieving revenue from merchants" do
  let!(:merchant) { create(:merchant) }
  let!(:customer) { create(:customer) }
  let!(:invoice) { create(:invoice, customer: customer, merchant: merchant) }
  let!(:transaction) { create(:transaction, invoice: invoice) }
  let!(:item_1) { create(:item, merchant: merchant, description: "purple") }
  let!(:item_2) { create(:item, merchant: merchant, description: "purple") }
  let!(:invoice_item_1) { create(:invoice_item, invoice: invoice, item: item_1, quantity: 5) }
  let!(:invoice_item_2) { create(:invoice_item, invoice: invoice, item: item_2, quantity: 5) }

  it "shows total revenue for a specific merchant" do
    item_one_total_price = item_1.unit_price * invoice_item_2.quantity
    item_two_total_price = item_2.unit_price * invoice_item_2.quantity

    get "/api/v1/merchants/#{merchant.id}/revenue"
item_one_total_price
item_two_total_price
    expect(response).to be_success
    expect(merchant["revenue"]).to eq("10.00")
  end
end

# variable = invoice_item.item.unit_price * invoice_item.quantity
# variable.sum of all invoice_items variable
