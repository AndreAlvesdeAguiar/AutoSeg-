class TasksController < ApplicationController
  before_action :authenticate_user!, only: %i[index new create destroy search]
  before_action :user_profile?
  before_action :find_task, only: %i[edit update show confirm_delete destroy delete_comment]
  skip_before_action :verify_authenticity_token, only: %i[search]
    
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
   @task = Task.create(task_params)
    @task.user = current_user
    if @task.save
      flash[:notice] = 'Profile Created!'
      redirect_to @task
    else
      render :new
    end
  end

  def edit
  end

  def update 
    if @task.update(task_params)
      flash[:notice] = 'Task Updated!'
      redirect_to @task
    else
      render :edit
    end 
    
    
  end

  def destroy
  end

  def complete
  end

  def incomplete
  end

  private

  def task_params
    params.require(:task).permit(:title, :description)
  end  

  def comment_params
  end 

  def sanitize_sql_like(string, escape_character = "\\")
    pattern = Regexp.union(escape_character, "%", "_")
    string.gsub(pattern) { |x| [escape_character, x].join }
  end
end
