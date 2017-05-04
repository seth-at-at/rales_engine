class Api::V1::Merchants::RevenueController < ApplicationController
  def show
    byebug
    revenue =  Merchant.find(params[:id]).params_check(params[:date])
    render json: revenue, serializer: MerchantRevenueSerializer
  end
end
