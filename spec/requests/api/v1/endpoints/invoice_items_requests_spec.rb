require 'rails_helper'

describe "invoice_item API" do
  it "sends a list of invoice_items" do
    create_list(:invoice_item, 3)

    get '/api/v1/invoice_items'
    expect(response).to be_success
    invoice_items = JSON.parse(response.body)

    expect(invoice_items.count).to eq(3)
  end

  it "can get one invoice_item id" do
    id = create(:invoice_item).id

    get "/api/v1/invoice_items/#{id}"
    invoice_item = JSON.parse(response.body)
    expect(invoice_item["id"]).to eq id
  end
end
