require 'rails_helper'

describe "merchants BI" do
  let(:date) {"2014-03-27T14:54:02.000Z"}
  let!(:merchant_1) { create(:merchant) }
  let!(:invoice_1) { create(:invoice, merchant: merchant_1,)}
  let!(:invoice_item_1) { create(:invoice_item, invoice: invoice_1, created_at: "2012-03-16", unit_price: 300, quantity: 1) }
  let!(:invoice_item_2) { create(:invoice_item, invoice: invoice_1, created_at: "2012-03-16", unit_price: 300, quantity: 1) }
  let!(:invoice_item_3) { create(:invoice_item, invoice: invoice_1, created_at: "2012-03-16", unit_price: 300, quantity: 1) }

  let!(:merchant_2) { create(:merchant) }
  let!(:invoice_2) { create(:invoice, merchant: merchant_2,)}
  let!(:invoice_item_4) { create(:invoice_item, invoice: invoice_2, created_at: "2012-03-16", unit_price: 200, quantity: 1) }
  let!(:invoice_item_5) { create(:invoice_item, invoice: invoice_2, created_at: "2012-03-16", unit_price: 200, quantity: 1) }
  let!(:invoice_item_6) { create(:invoice_item, invoice: invoice_2, created_at: "2012-03-16", unit_price: 200, quantity: 1) }

  let!(:merchant_3) { create(:merchant) }
  let!(:invoice_3) { create(:invoice, merchant: merchant_3)}
  let!(:invoice_item_7) { create(:invoice_item, invoice: invoice_3, created_at: "2012-03-16", unit_price: 100, quantity: 1) }
  let!(:invoice_item_8) { create(:invoice_item, invoice: invoice_3, created_at: "2012-03-16", unit_price: 100, quantity: 1) }
  let!(:invoice_item_9) { create(:invoice_item, invoice: invoice_3, created_at: "2012-03-16", unit_price: 100, quantity: 1) }

  let!(:merchant_4) { create(:merchant) }
  let!(:invoice_4) { create(:invoice, merchant: merchant_4)}
  let!(:invoice_item_10) { create(:invoice_item, invoice: invoice_4, created_at: "2012-03-16", unit_price: 100, quantity: 1) }

  xit "returns top x merchants ranked by total revenue" do
    get "/api/v1/merchants/most_revenue?quantity=2"
    merchants = JSON.parse(response.body)
    expect(response).to be_success
    expect(merchants["top_merchants"].first).to eq merchant_1
  end


end
