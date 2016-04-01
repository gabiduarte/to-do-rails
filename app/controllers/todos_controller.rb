class TodosController < ApplicationController
	
	def index
		@todos = Todo.all

		# serves as todos.json as well
		respond_to do |format|
			format.html
			format.json { render json: @todos }
		end
	end

end
