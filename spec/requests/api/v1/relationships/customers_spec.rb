require 'rails_helper'

describe 'Customer API relationship' do
  let!(:customer) { create(:customer) }
  let!(:invoice1) { create(:invoice, customer: customer) }
  let!(:invoice2) { create(:invoice, customer: customer) }
  let!(:invoice3) { create(:invoice, customer: customer) }
  let!(:transaction1) { create(:transaction, invoice: invoice1) }
  let!(:transaction2) { create(:transaction, invoice: invoice2) }
  let!(:transaction3) { create(:transaction, invoice: invoice3) }

  it 'invoices' do
    get "/api/v1/customers/#{customer.id}/invoices"
    customer_response = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer_response).to be_a Array

    customer_response.each do |invoices|
      expect(invoices['customer_id']).to eq customer.id
    end
    expect(customer_response.count).to eq 3
  end

  it 'transactions' do
    get "/api/v1/customers/#{customer.id}/transactions"
    customer_response = JSON.parse(response.body)

    expect(response).to be_success
    customer_response.each do |transactions|
      expect(Invoice.find(transactions['invoice_id']).customer).to eq customer
    end
    expect(customer_response.count).to eq 3
  end


end




#find invoice_items for single merchant_id
