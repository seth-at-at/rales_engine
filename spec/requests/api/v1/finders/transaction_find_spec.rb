require 'rails_helper'

describe "transaction API" do

  let(:date) {"2014-03-27T14:54:02.000Z"}

  context "find by" do
    let!(:invoice) { create(:invoice) }
    let!(:transaction_1) { create(:transaction) }
    let!(:transaction_2) { create(:transaction) }

    it "id" do
      id = transaction_1.id

      get '/api/v1/transactions/find', params:{ id: id }
      transaction = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction['id']).to eq transaction_1.id
    end

    it "invoice_id" do
      invoice_id = transaction_1.invoice_id

      get '/api/v1/transactions/find', params:{ invoice_id: invoice_id }
      transaction = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction['invoice_id']).to eq transaction_1.invoice_id
    end

    it "credit_card_number" do
      credit_card_number = transaction_1.credit_card_number

      get '/api/v1/transactions/find', params:{ credit_card_number: credit_card_number }
      transaction = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction['credit_card_number']).to eq transaction_1.credit_card_number
    end

    it "credit_card_expiration_date" do
      credit_card_expiration_date = transaction_1.credit_card_expiration_date

      get '/api/v1/transactions/find', params:{ credit_card_expiration_date: credit_card_expiration_date }
      transaction = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction['credit_card_expiration_date']).to eq transaction_1.credit_card_expiration_date
    end

    it "result" do
      result = transaction_1.result

      get '/api/v1/transactions/find', params:{ result: result }
      transaction = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction['result']).to eq transaction_1.result
    end

    it "created_at" do
      transaction_1.update(created_at: date)

      get '/api/v1/transactions/find', params:{ created_at: date }
      transaction = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction['invoice_id']).to eq transaction_1.invoice_id
    end

    it "updated_at" do
      transaction_2.update(updated_at: date)

      get '/api/v1/transactions/find', params:{ updated_at: date }
      transaction = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction['id']).to eq transaction_2.id
    end

    it "random transaction" do
      get '/api/v1/transactions/random'
      JSON.parse(response.body)

      expect(response).to be_success
    end
  end
end
