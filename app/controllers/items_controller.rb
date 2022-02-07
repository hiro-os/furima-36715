class ItemsController < ApplicationController
  def index
    #items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image,:title,:version,:category_id,:situation_id,:burdener_id,:area_id,:order_day_id,:price,:user_id).merge(user_id: current_user.id)
  end
end
