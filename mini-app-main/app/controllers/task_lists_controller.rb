class TaskListsController < ApplicationController
    def index
       # @task_lists = Task.order.all(:title)
        #@task_lists = Task.where(status: 'complete')
        @task_lists = Task.where(user: current_user)
        # @task_lists = Task.sort!(title)
        
        
         if params[:order].in? %w[new old]
          case params[:order]
          when 'new'
            @task_lists.order!(:comments)
           when 'old'
            @task_lists = Task.where(status: 'complete')
      end
        end
    end
  
    
    # GET /task_lists/1
    # GET /task_lists/1.json
    def show
        @task_lists = Task.all
    end
  
    # GET /task_lists/new
    def new
      @task_list = Task.new
    end
  
    # GET /task_lists/1/edit
    def edit
    end
  
    # POST /task_lists
    # POST /task_lists.json
    def create
      @task_list = Tasklist.new(task_list_params)
  
      respond_to do |format|
        if @task_list.save
          format.html { redirect_to @task_list, notice: 'Lista de Tarefas criada com sucesso!' }
          format.json { render :show, status: :created, location: @task_list }
        else
          format.html { render :new }
          format.json { render json: @task_list.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /task_lists/1
    # PATCH/PUT /task_lists/1.json
    def update
      respond_to do |format|
        if @task_list.update(task_list_params)
          format.html { redirect_to @task_list, notice: 'Lista de tarefas atualizada com sucesso!' }
          format.json { render :show, status: :ok, location: @task_list }
        else
          format.html { render :edit }
          format.json { render json: @task_list.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /task_lists/1
    # DELETE /task_lists/1.json
    def destroy
      @task_list.destroy
      respond_to do |format|
        format.html { redirect_to root_url, notice: 'Lista de tarefas deletada com sucesso!' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_task_list
        @task_list = Tasklist.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def task_list_params
        params.require(:task_list).permit(:title, :description)
      end
    
end
