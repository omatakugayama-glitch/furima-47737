class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item

  def index
    @purchase_destination = PurchaseDestination.new
  end

  def create
    @purchase_destination = PurchaseDestination.new(order_params)

    if @purchase_destination.valid?
      @purchase_destination.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:purchase_destination).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token).merge(user_id: current_user.id, item_id: @item.id)
  end
end