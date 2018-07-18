class ItemsController < ApplicationController

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    @new_item = Item.new

    if @item.save
      flash[:notice] = "Item was saved."
      redirect_to user_path(current_user)
    else
      flash.now[:alert] = "There was an error saving the item. Please try again."
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html { redirect_to user_path(current_user) }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end

    if @item.user == current_user
      if @item.destroy
        flash.now[:alert] = "Deleted item."
      else
        flash.now[:alert] = "Unable to remove item."
      end
    else
      flash.now[:alert] = "Item doesn't belong to you. Unable to remove item."
     end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end

end
