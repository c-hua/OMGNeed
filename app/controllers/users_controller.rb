class UsersController < ApplicationController
  def index
    @users = User.all
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



  def create
    @user = User.new(params.require(:user).permit(:username, :name, :email, :password, :password_confirmation))
    if @user.save
      redirect_to "#"
    else
      render 'new'
    end
  end
end
