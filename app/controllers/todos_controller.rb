class TodosController < ApplicationController
	
	def index
		@todos = Todo.all
    @todo = Todo.new

		respond_to do |format|
			format.html
			format.json { render json: @todos }
		end
	end

	def show
		@todo = Todo.find(params[:id])

	end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      flash[:notice] = "Yay!"
      redirect_to(todos_path)
    else
      flash[:error] = "Nay :("
      render :index
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to(todos_path)
  end


  private

  def todo_params
    params.require(:todo).permit(:name, :completed)
  end


end
