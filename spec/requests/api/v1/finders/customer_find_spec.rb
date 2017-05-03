require 'rails_helper'

describe "customer API" do

  let(:date) {"2014-03-27T14:54:02.000Z"}

  context "find by" do
    let!(:customer_1) { create(:customer) }
    let!(:customer_2) { create(:customer) }

    it "id" do
      id = customer_1.id

      get '/api/v1/customers/find', params:{ id: id }
      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer['id']).to eq customer_1.id
    end

    it "first_name" do
      first_name = customer_1.first_name

      get '/api/v1/customers/find', params:{ first_name: first_name }
      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer['first_name']).to eq customer_1.first_name
    end

    it "last_name" do
      last_name = customer_1.last_name

      get '/api/v1/customers/find', params:{ last_name: last_name }
      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer['last_name']).to eq customer_1.last_name
    end

    it "created_at" do
      customer_1.update(created_at: date)

      get '/api/v1/customers/find', params:{ created_at: date }
      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer['last_name']).to eq customer_1.last_name
    end

    it "updated_at" do
      customer_2.update(updated_at: date)

      get '/api/v1/customers/find', params:{ updated_at: date }
      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer['id']).to eq customer_2.id
    end
  end
end
