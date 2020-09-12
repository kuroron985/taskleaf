class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params) #←task_params＝private以下のtask_paramsメソッド
    task.save!
    redirect_to tasks_url, notice: "タスク「#{task.name}」を登録しました。"
  end

  def edit
  end

  private

  def task_params
    params.require(:task).permit(:name, :description) #←DBのtaskモデルからnameとdescriptionの値だけを呼び出す
  end
end
