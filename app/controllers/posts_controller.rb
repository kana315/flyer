class PostsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :edit, :create, :update, :destroy]
  before_action :set_post, only: [:edit, :show, :update, :destroy]
  before_action :new_post_access_restriction, only: [:new]
  before_action :edit_post_access_restriction, only: [:edit]
  before_action :set_post_params, only: [:confirm, :create]

  def index
    @q = Post.with_keywords(params.dig(:q, :keywords)).ransack(params[:q])
    @result = @q.result.page(params[:page]).per(24).order("id DESC")
  end

  def new
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.new
    end
    @troupes = Troupe.where(user_id: current_user)
  end

  def confirm
    render :new if @post.invalid?
  end

  def create
    if @post.save
      redirect_to root_path, notice:"#{@post.title}を投稿しました"
    else
      render 'new'
    end
  end

  def edit
    @troupe = Troupe.find_by(id: @post.troupe_id)
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(id: @post.id), notice:"投稿内容を編集しました"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice:"#{@post.title}を削除しました"
  end

  def show
    if current_user.present?
      @favorite = current_user.favorites.find_by(post_id: params[:id])
    end
    @favorites = @post.favorites
  end

  private
  def new_post_access_restriction
    unless current_user.troupes.present? then
      redirect_to new_troupe_path
    end
  end

  def edit_post_access_restriction
    unless current_user.id == @post.troupe.user_id then
      redirect_to new_troupe_path
    end
  end

  def post_params
    params.require(:post).permit(:troupe_id, :title, :caption, :story, :member,
                                 :ticket, :start_date, :end_date, :details_datetime,
                                 :address_zipcode, :address_prefecture_name, :address_city,
                                 :address_street, :address_bullding, :details_access,
                                 :flyer_front, :flyer_back, :flyer_front_cache, :flyer_back_cache)
  end

  def set_post
    @post = Post.find_by(id: params[:id])
  end

  def set_post_params
    @post = Post.new(post_params)
  end

  def search_params
    params.require(:q).permit!(:title_cont)
  end
end
