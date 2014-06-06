class ListsController < ApplicationController
	before_action :set_list, only: [ :show, :edit, :destroy, :update]
  respond_to :json, :html


   def index
    @lists = current_user.lists.all
    respond_with @lists
   end
 

  def edit
  end

  def new
  	@list = List.new
  end



  def create
    
  	@list = current_user.lists.new(list_params)
      if @list.save
        respond_to do |format|
          format.html { redirect_to news_feed_users_path}
          format.json { render json: @list, status: :created}
        end
      else
        respond_to do |format|
          format.html { render 'new' }
          format.json { render json: @list.errors, status: :unprocessable_entity}
        end
      end
  end

  def update
    if @list.update_attributes(list_params)
       respond_to do |format|
          format.html { redirect_to news_feed_users_path}
          format.json { render nothing: true, status: :no_content}
        end
      else
        respond_to do |format|
          format.html { render 'edit' }
          format.json { render json: @list.errors, status: :unprocessable_entity}
        end
    end
  end

  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to "#"}
      format.json { render json: { head: :ok } }
    end
  end 

  protected

  def set_list
    @list = current_user.lists.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end





end
