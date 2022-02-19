class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
    unless current_user.id == @item.user_id
      if @item.order.present?
        redirect_to root_path 
      end
    else
      redirect_to root_path 
    end
  end

  def create
    @item = Item.find(params[:item_id])
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

  def pay_item
    Payjp.api_key = "sk_test_e41d200738e573474dae8a7f" # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end