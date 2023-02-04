class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item, :image).permit(:title, :price, :concept, :category_id, :condition_id, :postage_payer_id, :ship_area, :ship_date, :user_id,)
  end
end
