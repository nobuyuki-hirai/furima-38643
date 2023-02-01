class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:title, :price, :concept, :category_id, :condition_id, :postage_payer_id, :ship_area, :ship_date, :user_id)
  end
end
