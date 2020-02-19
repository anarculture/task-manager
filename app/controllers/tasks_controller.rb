class TasksController < ApplicationController
  # before_action :find_task, only: [:show, :edit, :update, :destroy]
  before_action :find_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def show() end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save!
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit() end

  def update
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
