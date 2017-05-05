class Api::V1::Items::BestDayController < ApplicationController
  def show
    item_best_day = Item.find(params[:id]).best_day
    render json: item_best_day, serializer: ItemsBestDaySerializer
  end
end
