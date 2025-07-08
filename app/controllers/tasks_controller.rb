class TasksController < ApplicationController
  # def index
  #   @tasks = Task.all
  #   @task = Task.new
  # end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "タスクを作成しました"
    else
      @tasks = Task.all
      render "home/index", status: :unprocessable_entity
    end
  end

  def update
    @task = Task.find(params[:id])
    completed = params.dig(:task, :completed)
    @task.update(completed: completed)
    redirect_to tasks_path, notice: "タスクを完了変更"
  end

  def destroy
    @task = Task.find(params[:id])
    @task.update(is_deleted: true)
    redirect_to tasks_path, notice: "タスクを削除"
  end

  def show
  end

  def new
  end

  def edit
  end

  def bulk_update
    params[:tasks].each do |task_id, task_params|
      task = Task.find(task_id)
      completed = task_params[:completed] == "true"
      task.update(completed: completed)
    end
    redirect_to root_path, notice: "タスクを一括更新しました"
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :content)
  end
end
