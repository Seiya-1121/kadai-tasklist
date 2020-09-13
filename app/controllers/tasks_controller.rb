class TasksController < ApplicationController
  before_action :set_task, only:[:show, :edit, :update, :destroy]
    def index
        @tasks = Task.all
    end
    
    def show
        set_task
    end
    
    def new
        @task = Task.new
    end
    
    def create
        @task = Task.new(task_params)
        
        if @task.save
          flash[:success] = 'タスクが投稿されました'
          redirect_to @task
        else
          flash[:danger] = 'タスクが投稿されません'
          render :new
        end  
    end
    
    def edit
      set_task
    end
    
    def update
      set_task
      
      if @task.update(task_params)
        flash[:success] = 'タスクが編集されました'
        redirect_to @task
      else
        flash.now[:danger] = 'タスクが編集されませんでした'
        render :new
      end  
    end
    
    def destroy
      set_task
      @task.destroy
      
      flash[:success] = 'タスクが削除されました'
      redirect_to tasks_path
    end
end

private

def set_task
  @task = Task.find(params[:id])
end  

def task_params
  params.require(:task).permit(:content)
end  
