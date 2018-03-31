class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.favoriting(micropost)
    flash[:success] = "Micropostをお気に入りに追加しました"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unfavoriting(micropost)
    flash[:success] = "Micropostをお気に入りから削除しました"
    redirect_back(fallback_location: root_path)
  end
end

