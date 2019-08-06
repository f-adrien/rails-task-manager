class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id].to_i)
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.create(tasks_strong_parameters)
    redirect_to task_path(task)
  end

  def edit
    @task = Task.find(params[:id].to_i)
  end

  def update
     @task = Task.find(params[:id].to_i)
     @task.update(tasks_strong_parameters)
     redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id].to_i)
    @task.destroy
    redirect_to tasks_path
  end

  private

  def tasks_strong_parameters
    params.require(:task).permit(:title, :details, :completed)
  end

end
