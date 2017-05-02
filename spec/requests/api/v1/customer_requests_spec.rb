require 'rails_helper'

describe "customer API" do
  it "sends a list of customers" do
    create_list(:customer, 3)

    get '/api/v1/customers'
    expect(response).to be_success
    customers = JSON.parse(response.body)

    expect(customers.count).to eq(3)
  end

  it "can get one customer id" do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"
    customer = JSON.parse(response.body)
    expect(customer["id"]).to eq id
  end

  it "can create a new merhcant" do
    customer_params = {first_name: "Banana"}

    post '/api/v1/customers', params: { customer: customer_params }
    customer = Customer.last
    assert_response :success
    expect(response).to be_success
    expect(customer.first_name).to eq customer_params[:first_name]
  end

  it "update an existing merhcant" do
    id = create(:customer).id

    previous_first_name = Customer.last.first_name
    customer_params = { first_name: "Christopherson" }

    put "/api/v1/customers/#{id}", params: { customer: customer_params }
    customer = Customer.find_by(id: id)
    expect(response).to be_success
    expect(customer.first_name).to_not eq previous_first_name
    expect(customer.first_name).to eq "Christopherson"
  end

  it "can destroy an customer" do
    customer = create(:customer)

    expect(Customer.count).to eq 1

    delete "/api/v1/customers/#{customer.id}"
    expect(response).to be_success
    expect(Customer.count).to eq 0
    expect{ Customer.find(customer.id) }.to raise_error(ActiveRecord::RecordNotFound)
  end

  it "can destroy an customer" do
    id = create(:customer).id

    expect{delete "/api/v1/customers/#{id}"}.to change(Customer, :count).by(-1)
    expect(response).to be_success
    expect{ Customer.find(id) }.to raise_error(ActiveRecord::RecordNotFound)

  end
end
