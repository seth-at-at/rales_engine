class Api::V1::Merchants::RevenueByDateController < ApplicationController
  def index
    revenue = Merchant.revenue_by_date(params[:date])
    render json: revenue, serializer: MerchantRevenueOnDateSerializer
  end
end
