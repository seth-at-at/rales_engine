class Api::V1::Merchants::MostRevenueController < ApplicationController
  def index
     render json:  Merchant.top_merchants(params[:quantity])
  end
end
