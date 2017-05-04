class Api::V1::Merchants::FavoriteCustomerController < ApplicationController
  def show
    favorite_customer = Merchant.find(params[:id]).favorite_customer
    render json: favorite_customer, serializer: MerchantFavoriteCustomerSerializer
  end
end
