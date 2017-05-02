class Api::V1::Items::FindController < ApplicationController
  def show
    render json: Item.find_by(incoming_params)
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
end
