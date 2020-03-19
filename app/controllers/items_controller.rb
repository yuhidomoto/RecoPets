class ItemsController < ApplicationController

  def index
    @items = current_user.items
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @items = current_user.items
    @item.user_id = current_user.id
    if @item.save
      flash[:success] = "新しいアイテムが追加されました！"
    else
      render :error
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:success] = "新しいアイテムが追加されました！"
      redirect_to items_path
    else
      render 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @items = current_user.items
    #binding.pry
    @item.destroy
  end

  private
  def item_params
      params.require(:item).permit(:name, :days, :amount)
  end

end
