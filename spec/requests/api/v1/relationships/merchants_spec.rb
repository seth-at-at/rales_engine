require 'rails_helper'

describe 'Merchant API relationship' do
  let!(:merchant) { create(:merchant) }
  let!(:customer) { create(:customer) }
  let!(:invoice1) { create(:invoice, merchant_id: merchant.id) }
  let!(:invoice2) { create(:invoice, merchant_id: merchant.id) }
  let!(:invoice3) { create(:invoice, merchant_id: merchant.id) }
  let!(:item_2) { create(:item, merchant_id: merchant.id) }
  let!(:item_1) { create(:item, merchant_id: merchant.id) }
  let!(:item_3) { create(:item, merchant_id: merchant.id) }
  let!(:item_4) { create(:item, merchant_id: merchant.id) }

  it 'items' do
    get "/api/v1/merchants/#{merchant.id}/items"
    merchant_items = JSON.parse(response.body)

    expect(response).to be_success
    merchant_items.each do |items|
      expect(items['merchant_id']).to eq merchant.id
    end
    expect(merchant_items.count).to eq 4
  end

  it 'invoices' do
    get "/api/v1/merchants/#{merchant.id}/invoices"
    merchant_invoices = JSON.parse(response.body)

    expect(response).to be_success
    merchant_invoices.each do |invoices|
      expect(invoices['merchant_id']).to eq merchant.id
    end
    expect(merchant_invoices.count).to eq 3
  end


end
