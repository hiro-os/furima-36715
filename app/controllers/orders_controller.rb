class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    #@order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path 
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postcode, :area_id, :city, :street, :building, :phone).merge(user_id: current_user.id)
    
  end
end