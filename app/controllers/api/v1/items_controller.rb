class Api::V1::ItemsController < ApplicationController
  def index
    render json: Item.all
  end

  def show
    # require 'pry'; binding.pry
    @item = Item.find_by(params[:id])
    render json: @item
  end
end
