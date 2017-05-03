class Api::V1::Merchants::RevenueController < ApplicationController
  def show
    byebug
    render json: Merchant.find(params[:id])
  end
end
