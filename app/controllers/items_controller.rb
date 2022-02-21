class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
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

  def show
    @item = Item.find(params[:id])
  end

 private
  def item_params
    params.require(:item).permit(:image, :items_name, :info, :category_id, :condition_id, :shipping_price_id,
                                  :place_id, :day_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
