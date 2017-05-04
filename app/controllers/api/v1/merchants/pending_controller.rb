class Api::V1::Merchants::PendingController < ApplicationController
  def index
    customers = Merchant.find(params[:id]).customers_with_pending_invoices
    render json: customers, serializer: MerchantsPendingSerializer
  end
end
