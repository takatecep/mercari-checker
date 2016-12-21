class CheckItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @check_items = current_user.check_items
  end

  def new
    @check_item = current_user.check_items.build
    @check_item.user_id = current_user.id
  end

  def create
    @check_item = CheckItem.new(check_item_params)
    if @check_item.save
      redirect_to check_items_url
    else
      render 'new'
    end
  end

  def edit
    @check_item = CheckItem.find(params[:id])
    @check_item.user_id = current_user.id
  end

  def update
    @check_item = CheckItem.find(params[:id])
    if @check_item.update_attributes(check_item_params)
      redirect_to check_items_url
    else
      render 'edit'
    end
  end

  def destroy
    CheckItem.find(params[:id]).destroy
    redirect_to check_items_url
  end

  private

  def check_item_params
    params.require(:check_item).permit(
      :user_id,
      :name,
      :price_min,
      :price_max
    )
  end
end
