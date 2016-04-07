class TodosController < ApplicationController
	before_action :find_todo, only: [:show, :destroy, :update, :toggle_completed]
	
  def index
		@todos = Todo.all
    @todo = Todo.new

		respond_to do |format|
			format.html
			format.json { render json: @todos }
		end
	end

  def create
    @todo = Todo.new(todo_params)
    @todo[:completed] ||= false

    if @todo.save
      flash[:notice] = "Yay!"
    else
      flash[:error] = "Nay :("
    end

    redirect_to(todos_path)
  end

  def destroy
    @todo.destroy
    redirect_to(todos_path)
  end

  def toggle_completed
    @todo.toggle!(:completed)
    redirect_to(todos_path)
  end


  private

  def todo_params
    params.require(:todo).permit(:name, :completed)
  end

  def find_todo
    @todo = Todo.find(params[:id])
  end
end
