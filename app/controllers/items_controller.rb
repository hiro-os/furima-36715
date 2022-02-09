class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @items = Item.order("id")
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
    params.require(:item).permit(:image,:title,:version,:category_id,:situation_id,:burdener_id,:area_id,:order_day_id,:price).merge(user_id: current_user.id)
  end
end
