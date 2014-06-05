class ProductsController < ApplicationController
	respond_to :json, :html
	def index
		@imports = Product.party(params[:limit], params[:category], params[:search])
		respond_with @imports
	end
end
