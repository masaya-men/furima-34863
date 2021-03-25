class OrdersController < ApplicationController
  before_action :item_params, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :back_to_index, only: [:index, :create]
  before_action :check_item, only: [:index, :create]

  def index
    # @item = Item.find(params[:item_id])LGTMまで残します
    @order_address = OrderAddress.new
  end

  def create
    # @item = Item.find(params[:item_id])LGTMまで残します
    @order_address = OrderAddress.new(ordered_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      render :show
    else
      render :index
    end
  end

  def show
  end

  private

  def item_params
    @item = Item.find(params[:item_id])
  end

  def ordered_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :municipality, :address, :phone_number, :building,).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def back_to_index
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def check_item
    if @item.order.present?
      redirect_to root_path
    end
  end

  # =========LGTMまで残す=============
  # def order_params
  #   params.permit(:postal_code, :prefecture_id, :municipality,
  #     :phone_number, :order_id, :building).merge(user_id: current_user.id)
  # end
  # =========LGTMまで残す=============


end
