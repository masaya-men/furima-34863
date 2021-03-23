class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_params, only: [:show, :edit]
  before_action :item_params, only: :update

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
    # @item = Item.find(params[:id])LGTM後に消す
  end

  def edit
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
    # @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(
      :item_name, :item_detail, :status_id, :category_id, :price, :shipping_charge_id, :shipping_day_id, :prefecture_id, :image
    ).merge(user_id: current_user.id)
  end

  def set_params
    @item = Item.find(params[:id])
  end
end
