class Api::V1::InvoiceItems::FindController < ApplicationController
  def show
    render json: InvoiceItem.find_by(search_params)
  end
private
  def incoming_params
    params.permit(:id,
                  :invoice_id,
                  :item_id,
                  :quantity,
                  :unit_price,
                  :created_at,
                  :updated_at)
  end

  def convert_unit_price
    (params[:unit_price].to_f * 100).round
  end

  def search_params
    parameters = incoming_params
    parameters[:unit_price] = convert_unit_price if params[:unit_price]
    parameters
    # parameters.except("unit_price")
  end
end
