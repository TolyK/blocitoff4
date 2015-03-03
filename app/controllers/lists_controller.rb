class ListsController < ApplicationController

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end
  
  def create
    @list = current_user.build_list(list_params)
    # @list = List.new(list_params)
    # @list.user = current_user
    
    if @list.save
      redirect_to current_user
    else
      render 'new'
    end
  end

  def edit
  end
  
  def destroy
    @list.destroy
    redirect_to user_path
  end
  
  private
  
  def list_params
    params.require(:list).permit(:title)
  end
end
