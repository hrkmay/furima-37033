class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    authenticate_user!
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
    params.require(:item).permit(:image, :items_name, :info, :category_id, :condition_id, :shipping_price_id,
                                  :place_id, :day_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
