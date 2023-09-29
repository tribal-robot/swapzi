class UsersController < ApplicationController
  skip_after_action :verify_authorized, only: :profile

  def dashboard
    @user = current_user
    @swapzi_score = @user.swapzi_score
    @recent_favourites = Favourite.where(user: @user).order(created_at: :desc).limit(4)
    @recent_items_browsed = BrowsingHistory.where(user: @user).order(created_at: :desc).limit(5).map(&:item)
    @item_suggestions = Item.where.not(user: @user).order(created_at: :desc).limit(4)

    authorize @recent_favourites
  end

  def profile
    @all_items = Item.where(user: current_user)
  end
end
