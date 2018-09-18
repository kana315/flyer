class TopsController < ApplicationController
  layout 'index'

  def index
    if user_signed_in?
      redirect_to posts_path
    end
  end
end
