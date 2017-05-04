class Api::V1::Customers::FavoriteMerchantController < ApplicationController
  def show
    merchant = Customer.find(params[:id]).favorite_merchant
    render json: merchant, serializer: CustomersFavoriteMerchantSerializer
  end
end
