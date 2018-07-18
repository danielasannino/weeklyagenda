class UsersController < ApplicationController
  before_action :find_user

  def show
    @item = Item.new
    @items = Item.where(user: @user)
  end

  private

  def find_user
    if params[:id]
      user_id = params[:id]
    else
      user_id = current_user.id
    end

    @user = User.find(user_id)
  end
end
