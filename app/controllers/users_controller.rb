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

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params.require(:user).permit(:username, :name, :email, :password, :password_confirmation))
      redirect_to "#"
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to "#"
  end

end
