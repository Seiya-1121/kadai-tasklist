class ToppagesController < ApplicationController
  def index
    if logged_in?
      @taskpost = current_user.taskposts.build
      @taskposts = current_user.taskposts.order(id: :desc).page(params[:page])
    end
  end
end
