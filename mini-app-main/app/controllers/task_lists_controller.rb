class TaskListsController < ApplicationController
    def index
        @task_lists = Task.all
    end
  
    # GET /task_lists/1
    # GET /task_lists/1.json
    def show
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
      @todo_list = Tasklist.new(todo_list_params)
  
      respond_to do |format|
        if @todo_list.save
          format.html { redirect_to @todo_list, notice: 'Lista de Tarefas criada com sucesso!' }
          format.json { render :show, status: :created, location: @todo_list }
        else
          format.html { render :new }
          format.json { render json: @todo_list.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /task_lists/1
    # PATCH/PUT /task_lists/1.json
    def update
      respond_to do |format|
        if @todo_list.update(todo_list_params)
          format.html { redirect_to @todo_list, notice: 'Lista de tarefas atualizada com sucesso!' }
          format.json { render :show, status: :ok, location: @todo_list }
        else
          format.html { render :edit }
          format.json { render json: @todo_list.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /task_lists/1
    # DELETE /task_lists/1.json
    def destroy
      @todo_list.destroy
      respond_to do |format|
        format.html { redirect_to root_url, notice: 'Lista de tarefas deletada com sucesso!' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_todo_list
        @todo_list = Tasklist.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def todo_list_params
        params.require(:todo_list).permit(:title, :description)
      end
    
end
