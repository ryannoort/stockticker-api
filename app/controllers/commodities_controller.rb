class CommoditiesController < ApplicationController
  def index
    @commodities = Commodity.all
  end

  def show
    @commodity = Commodity.find_by(name: params[:name])

    head :not_found unless @commodity
  end
end
