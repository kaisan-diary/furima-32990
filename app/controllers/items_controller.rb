class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_tweet, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]




  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    binding.pry
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
  end
  
  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end  

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :edit
    end    
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :shipping_burden_id, :prefecture_id, :shipping_date_id, :price, :image ).merge(user_id: current_user.id)
  end  

  def set_tweet
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless user_signed_in? && current_user.id == @item.user_id
  end
end
