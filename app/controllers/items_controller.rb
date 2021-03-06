class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit,:destroy]
  before_action :set_item,only: [:edit,:show,:update, :destroy]
  before_action :move_to_index, except: [:index, :show, :new, :create]
  
  def index
    @items = Item.order(created_at: :DESC)
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

  def show
  end

  def edit
    if @item.order.present?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to action: :index
  end

  private

  def item_params
    params.require(:item).permit(:image,:title,:version,:category_id,:situation_id,:burdener_id,:area_id,:order_day_id,:price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless  current_user.id == @item.user_id
      redirect_to action: :index
    end
  end
end
