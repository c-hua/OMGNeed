class SessionsController < ApplicationController
  def new
  end

  #login
  def create
    @user = User.where(:email => params[:session][:email]).first
    if @user && @user.authenticate(params[:session][:password]) == @user
        session[:remember_token] = @user.id
        @current_user = @user
        redirect_to(news_feed_user_path(@current_user))
        flash[:success] ='You successfully logged in'
    else
        flash[:warning] ='Invalid email/password combination'
        render "new"
    end
  end

  #logout
  def destroy
  session.delete(:remember_token)
  redirect_to root_path
  end
end
