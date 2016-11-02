class Api::V1::ItemsController < ApplicationController
  def index
    render json: Item.all
  end

  def show
    # require 'pry'; binding.pry
    @item = Item.find_by(params[:id])
    render json: @item
  end

  def destroy
    @item = Item.find_by(params[:id])
    @item.destroy
    render json: { "message": "Item #{params[:id]} was deleted", "status": "204" }
  end
end
