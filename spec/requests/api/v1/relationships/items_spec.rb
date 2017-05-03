require 'rails_helper'

describe 'Item API relationship' do
  let!(:merchant) { create(:merchant) }
  let!(:customer) { create(:customer) }
  let!(:invoice) { create(:invoice, merchant_id: merchant.id) }
  let!(:item) { create(:item, merchant_id: merchant.id) }
  let!(:invoice_item) {create(:invoice_item, item: item, invoice: invoice)}
  let!(:invoice_item2) {create(:invoice_item, item: item, invoice: invoice)}

  it 'invoice_items' do
    get "/api/v1/items/#{item.id}/invoice_items"
    items_reponse = JSON.parse(response.body)

    expect(response).to be_success
    items_reponse.each do |invoice_items|
      expect(invoice_items['item_id']).to eq item.id
    end
    expect(items_reponse.count).to eq 2
  end

  it 'merchant' do
    get "/api/v1/items/#{merchant.id}/merchant"
    items_merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(items_merchant["id"]).to eq merchant.id
  end


end
