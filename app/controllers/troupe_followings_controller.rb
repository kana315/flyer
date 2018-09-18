class TroupeFollowingsController < ApplicationController
  before_action :authenticate_user!

  def create
    troupe_following = current_user.troupe_followings.create(troupe_id: params[:troupe_id])
    redirect_to troupe_path(troupe_following.troupe_id)
  end

  def destroy
    troupe_following = current_user.troupe_followings.find_by(id: params[:id]).destroy
    redirect_to troupe_path(troupe_following.troupe_id)
  end
end
