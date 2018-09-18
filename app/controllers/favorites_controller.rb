class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    favorite = current_user.favorites.create(post_id: params[:post_id])
    redirect_to post_path(favorite.post_id), notice:"「#{favorite.post.title}」をお気に入りに登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to post_path(favorite.post_id), notice:"「#{favorite.post.title}」のお気に入りを解除しました"
  end

end
