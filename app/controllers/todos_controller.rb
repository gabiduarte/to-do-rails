class TodosController < ApplicationController
	
	def index
		@todos = Todo.all

    @todo = Todo.new

		# serves as todos.json as well
		respond_to do |format|
			format.html
			format.json { render json: @todos }
		end
	end

	def show
		@todo = Todo.find(params[:id])

		# respond_to do |format|
		# 	format.html
		# 	format.json { render json: @todo }
		# end
	end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      flash[:notice] = "Todo salvo"
      redirect_to(todos_path)
    else
      flash[:notice] = "Houve um erro"
      render :new
    end
  end


  private

  def todo_params
    params.require(:todo).permit(:name, :completed)
  end


end
