class Api::V1::ItemsController < ApplicationController
  def index
    render json: Item.all
  end

  def show
    @item = Item.find_by(params[:id])
    render json: @item
  end

  def destroy
    @item = Item.find_by(params[:id])
    @item.destroy
    render json: { "message": "Item #{params[:id]} was deleted", "status": "204" }
  end

  def create
    @item = Item.new(item_params)
    # require 'pry'; binding.pry

    if @item.save
      render json: { "message": "Item '#{@item.name}' was created!", "status": "201" }
    else

    end
  end

  private

  def item_params
    params.permit(:name, :description, :image_url)
  end
end
