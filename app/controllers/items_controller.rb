class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :item_id, only: [:show, :edit, :update, :destroy]
  before_action :ensure_current_user, only: [:edit, :update, :destroy]

  def index
    @items = Item.order('created_at DESC')
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
  end

  def edit
    redirect_to root_path if @item.history.present?
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id), method: :get
    else render :edit
    end
  end

  def destroy
    redirect_to root_path if @item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :category_id, :status_id, :fee_id, :area_id, :day_id,
                                 :price, :image).merge(user_id: current_user.id)
  end

  def ensure_current_user
    redirect_to action: :index unless user_signed_in? && current_user.id == @item.user_id
  end

  def item_id
    @item = Item.find(params[:id])
  end
end
