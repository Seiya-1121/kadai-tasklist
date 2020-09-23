class ToppagesController < ApplicationController
  def index
    if logged_in?
      @task = current_user.task.build 
      @tasks = current_user.tasks.order(id: :desc).page(params[:page]).per(3)
    end
  end
end
