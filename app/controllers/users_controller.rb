class UsersController < ApplicationController

  respond_to :json, :html

  def news_feed
    @imports = Product.party(params[:limit], params[:category], params[:search])
    @user = User.find(params[:user_id])
    @lists = List.where(user_id: @user.id)
    respond_with @users
    #<%= link_to 'add product', pages_path(:page => {:list_id => @list.id, :url => p["name"]}), :method => :post %>
  end

  def index
    @users = User.all
    respond_with @users
  end

  def show
  	@user = User.find(params[:id])
    @lists = @user.lists

    respond_with @user
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
