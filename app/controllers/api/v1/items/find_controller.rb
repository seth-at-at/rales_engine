class Api::V1::Items::FindController < ApplicationController
  def index
    render json: Item.where(search_params)
  end

  def show
    render json: Item.where(search_params).first
  end
private
  def incoming_params
    params.permit(:id,
                  :name,
                  :description,
                  :unit_price,
                  :created_at,
                  :updated_at,
                  :merchant_id)
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
