class MalfunctionController < ApplicationController
	def new
		@malfunction = Malfunction.new
	end

	def delete
	end

	def index
		@malfunction = Malfunction.all
	end

	def show
		@malfunction = Malfunction.find(params[:id])
	end

	private 
	def malfunction_params
		params.require(:malfunction).permit(:description)
	end
end
