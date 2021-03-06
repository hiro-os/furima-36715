class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item,only: [:index,:create]
  def index
    @order_address = OrderAddress.new
    unless current_user.id == @item.user_id
      if @item.order.present?
        redirect_to root_path 
      end
    end
    if current_user.id == @item.user_id
      redirect_to root_path 
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postcode, :area_id, :city, :street, :building, :phone).merge(user_id: current_user.id,token: params[:token],item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end