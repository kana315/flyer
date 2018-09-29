class UsersController < ApplicationController
  before_action :set_user
  before_action :set_request_troupes

  def posts
    @admin_troupes = @user.troupes
  end

  def favorites
    @favorite_posts = @user.favorite_posts
  end

  def troupes
    @admin_troupes = @user.troupes
    @member_troupes = @user.member_troupes
  end

  def following_troupes
    @following_troupes = @user.follow_troupes
  end

  def member_requests
  end

  private
  def set_user
    @user = User.find_by(id: params[:id])
  end

  def set_request_troupes
    @request_troupes = @user.request_troupes
  end
end
