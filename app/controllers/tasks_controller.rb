class TasksController < ApplicationController
    before_action:set_task,only:[:show,:edit,:update,:destroy]
    def index
        @tasks=Task.all
    end
    
    def show
    end
    
    def new
        @task=Task.new
    end
    
    def create
        @task=Task.new(task_params)
        if @task.save
            flash[:succes]='taskが正常に追加しました'
            redirect_to @task
        else
            flash.now[:denger]='taskが追加されませんでした'
            render :new
        end
    end
    
    def edit
    end
    
    def update
        if @task.update(task_params)
            flash[:success] = 'task は正常に追加されました'
            redirect_to @task
        else
            flash.now[:danger] = 'taskは追加されませんでした'
            render :edit
        end
    end
    def destroy
        @task.destroy
        flash[:succes]="taskは正常に削除されました"
        redirect_to tasks_url
    end
    private
    def set_task
        @task=Task.find(params[:id])
    end
    def task_params
        params.require(:task).permit(:content,:status)
    end
end