require 'rails_helper'

describe 'Transaction API relationship' do
  let!(:invoice) { create(:invoice) }
  let!(:transaction) { create(:transaction, invoice: invoice) }

  it 'invoice' do
    get "/api/v1/transactions/#{transaction.id}/invoice"
    transaction_response = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction_response["id"]).to eq invoice.id
  end


end
