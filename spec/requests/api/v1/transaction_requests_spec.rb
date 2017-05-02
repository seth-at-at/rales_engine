require 'rails_helper'

describe "transaction API" do
  it "sends a list of transactions" do
    create_list(:transaction, 3)

    get '/api/v1/transactions'
    expect(response).to be_success
    transactions = JSON.parse(response.body)

    expect(transactions.count).to eq(3)
  end

  it "can get one transaction id" do
    id = create(:transaction).id

    get "/api/v1/transactions/#{id}"
    transaction = JSON.parse(response.body)
    expect(transaction["id"]).to eq id
  end

  it "can create a new transaction" do
    transaction_params = {invoice_id: 1,
                          credit_card_number: 4654405418249632,
                          credit_card_expiration_date: nil,
                          result: "success" }

    post '/api/v1/transactions', params: { transaction: transaction_params }
    transaction = Transaction.last
    assert_response :success
    expect(response).to be_success
    expect(transaction.credit_card_number).to eq transaction_params[:credit_card_number]
  end

  it "update an existing merhcant" do
    id = create(:transaction).id

    previous_credit_card_number = Transaction.last.credit_card_number
    transaction_params = {invoice_id: 1,
                          credit_card_number: 4654405418249611,
                          credit_card_expiration_date: nil,
                          result: "success" }

    put "/api/v1/transactions/#{id}", params: { transaction: transaction_params }
    transaction = Transaction.find_by(id: id)
    expect(response).to be_success
    expect(transaction.credit_card_number).to_not eq previous_credit_card_number
    expect(transaction.credit_card_number).to eq 4654405418249611
  end

  it "can destroy an transaction" do
    transaction = create(:transaction)

    expect(Transaction.count).to eq 1

    delete "/api/v1/transactions/#{transaction.id}"
    expect(response).to be_success
    expect(Transaction.count).to eq 0
    expect{ Transaction.find(transaction.id) }.to raise_error(ActiveRecord::RecordNotFound)
  end

  it "can destroy an transaction" do
    id = create(:transaction).id

    expect{delete "/api/v1/transactions/#{id}"}.to change(Transaction, :count).by(-1)
    expect(response).to be_success
    expect{ Transaction.find(id) }.to raise_error(ActiveRecord::RecordNotFound)

  end
end
