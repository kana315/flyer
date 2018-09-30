class TroupesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :member_request, :posts, :member_relations, :waiting_members]
  before_action :set_troupe, only: [:edit, :update, :member_request, :posts, :member_relations, :waiting_members]
  before_action :access_restriction, only: [:edit, :update]
  before_action :set_troupe_followings, only: [:posts, :member_relations, :waiting_members]
  before_action :set_members, only: [:posts, :member_relations, :waiting_members]
  before_action :set_member_requests, only: [:posts, :member_relations, :waiting_members]

  def new
    @troupe = Troupe.new
  end

  def create
    @troupe = Troupe.new(troupe_params)
    @troupe.user_id = current_user.id
    if @troupe.save
      redirect_to troupe_path(@troupe.id), notice: "#{@troupe.name}を登録しました"
    else
      render 'new'
    end
  end

  def index
    @search = Troupe.ransack(params[:q])
    @result = @search.result.page(params[:page]).per(20).order("id DESC")
  end

  def edit
  end

  def update
    if @troupe.update(troupe_params)
      redirect_to troupe_path(@troupe.id), notice:"登録内容を更新しました"
    else
      render 'edit'
    end
  end

  def posts
    if current_user.present?
      @troupe_following = current_user.troupe_followings.find_by(troupe_id: @troupe.id)
    end
    @posts = @troupe.posts
  end

  def member_relations
    @troupe_following = current_user.troupe_followings.find_by(troupe_id: @troupe.id)
    @troupe_admin = User.find_by(id: @troupe.user_id)
    @members = @troupe.member_relations
  end

  def waiting_members
    @troupe_following = current_user.troupe_followings.find_by(troupe_id: @troupe.id)
    @troupe_admin = User.find_by(id: @troupe.user_id)
  end

  def member_request
    @member_relation = current_user.member_relations.find_by(troupe_id: @troupe.id)
    @member_request = MemberRequest.find_by(user_id: current_user.id)
  end

  private
  def access_restriction
    unless current_user.id == @troupe.user_id then
      redirect_to new_troupe_path
    end
  end

  def troupe_params
    params.require(:troupe).permit(:name, :caption, :icon, :icon_cache)
  end

  def set_troupe
    @troupe = Troupe.find(params[:id])
  end

  def set_troupe_followings
    @troupe_followings = @troupe.follow_users
  end

  def set_members
    @members = @troupe.member_relations
  end

  def set_member_requests
    @member_requests = MemberRequest.where(troupe_id: @troupe.id)
  end

end
