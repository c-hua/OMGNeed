class UsersController < ApplicationController
  def index
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])

  end

  def new
  	@user = User.new
  end

end
