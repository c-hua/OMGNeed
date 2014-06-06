class UsersController < ApplicationController
  # before_action :set_user, only: [  :edit, :delete]
  respond_to :json, :html

  def news_feed  
    respond_with current_user
    #<%= link_to 'add product', pages_path(:page => {:list_id => @list.id, :url => p["name"]}), :method => :post %>
  end

  def edit
  end

  def new
  	@user = User.new
  end



  def create
    @user = User.new(user_params)
      if @user.save
        respond_to do |format|
          format.html { redirect_to (news_feed_user_path(@user))}
          format.json { render json: @user, status: :created}
        end
      else
        respond_to do |format|
          format.html { render 'new' }
          format.json { render json: @user.errors, status: :unprocessable_entity}
        end
      end
  end

  def update
    if current_user.update_attributes(user_params)
       respond_to do |format|
          format.html { redirect_to "#"}
          format.json { render nothing: true, status: :no_content}
        end
      else
        respond_to do |format|
          format.html { render 'edit' }
          format.json { render json: @user.errors, status: :unprocessable_entity}
        end
    end
  end

  def destroy
    current_user.destroy
    respond_to do |format|
      format.html { redirect_to "#"}
      format.json { render json: { head: :ok } }
    end
  end 

  protected

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :name, :email, :password, :password_confirmation)
  end




end
