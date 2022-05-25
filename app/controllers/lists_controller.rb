class ListsController < ApplicationController
  def index
    @lists = policy_scope(List)
  end

  def new
    # @list = List.new
    authorize @list
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    authorize @list

    if @list.save
      redirect_to user_dashboard_path(current_user), notice: "#{@list.title} has been added"
    else
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
    authorize @list
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end
end
