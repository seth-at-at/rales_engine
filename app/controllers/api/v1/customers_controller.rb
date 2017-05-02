class Api::V1::CustomersController < ApplicationController
  def index
    render json: Customer.all
  end

  def show
    render json: Customer.find(params[:id])
  end

  def create
    render json: Customer.create(transaction)
  end

  def update
    render json: Customer.update(params[:id], transaction)
  end

  def destroy
    render json: Customer.delete(params[:id])
  end
private
  def transaction
    params.require(:customer).permit(:first_name,
                                     :last_name,
                                     :credit_card_expiration_date,
                                     :result)
  end
end
