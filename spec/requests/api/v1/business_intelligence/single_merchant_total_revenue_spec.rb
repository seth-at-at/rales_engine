require 'rails_helper'

describe "retrieving revenue from merchants" do
  let(:date) {"2014-03-27T14:54:02.000Z"}
  let!(:merchant) { create(:merchant) }
  let!(:customer) { create(:customer) }
  let!(:invoice) { create(:invoice, customer: customer, merchant: merchant) }
  let!(:invoice2) { create(:invoice, customer: customer, merchant: merchant) }
  let!(:transaction) { create(:transaction, invoice: invoice) }
  let!(:item_1) { create(:item, merchant: merchant, unit_price: 300) }
  let!(:item_2) { create(:item, merchant: merchant, unit_price: 100) }
  let!(:invoice_item_1) { create(:invoice_item, invoice: invoice, item: item_1, unit_price: 300, quantity: 1) }
  let!(:invoice_item_3) { create(:invoice_item, invoice: invoice, item: item_1, unit_price: 250, quantity: 2) }
  let!(:invoice_item_2) { create(:invoice_item, invoice: invoice2, item: item_2, unit_price: 100, quantity: 5) }

  it "shows total revenue for a specific merchant" do
    get "/api/v1/merchants/#{merchant.id}/revenue"
    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["revenue"]).to eq("8.0")
  end

  it "shows total revenue for a specific merchant on a given date" do
    date_one  = "2012-03-16 11:55:05"
    date_two  = "2012-03-07 10:54:55"
    invoice.update(created_at: date_two)
    invoice2.update(created_at: date_one)


    get "/api/v1/merchants/#{merchant.id}/revenue?date=#{date_one}"
    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["revenue"]).to eq("5.0")
  end
end
