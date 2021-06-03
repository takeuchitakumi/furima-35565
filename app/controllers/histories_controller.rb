class HistoriesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_id, only: [:index, :create]
  before_action :ensure_current_user, only: [:index, :create]
  before_action :sold_out_item, only: [:index]
  def index
    @history_address = HistoryAddress.new
  end

  def create
    @history_address = HistoryAddress.new(history_params)
    if @history_address.valid?
      pay_item
      @history_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def history_params
    params.require(:history_address).permit(:postal, :prefecture_id, :city, :house_number, :building_name, :phone).merge(
      item_id: params[:item_id], user_id: current_user.id, token: params[:token]
    )
  end

  def item_id
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: history_params[:token],
      currency: 'jpy'
    )
  end

  def ensure_current_user
    redirect_to root_path if user_signed_in? && current_user.id == @item.user_id
  end

  def sold_out_item
    redirect_to root_path if @item.history.present?
  end
end
