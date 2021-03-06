class TasksController < ApplicationController
  
  def index 
    if params[:category].blank?
      @tasks = Task.all.order("created_at DESC")
    else 
      @category_id = Category.find_by(name: params[:category]).id
      @tasks = Task.where(category_id: @category_id).order("created_at DESC")
    end
  end
  
  def show
    find_task
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    
    if @task.save 
      redirect_to @task
    else 
      render "New"
    end
  end
  
  def edit
    find_task
  end
  
  def update
    find_task
    
    if @task.update(task_params)
      redirect_to @task
    else
      render 'Edit'
    end
  end
  
  def destroy
    find_task
    @task.destroy
    redirect_to root_path
  end
  
  private
  def task_params
    params.require(:task).permit(:title, :description, :company, :url, :category_id)  
  end
  
  def find_task
    @task = Task.find(params[:id])
  end
  
end
