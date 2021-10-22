class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params_lists)
    if @list.save
      redirect_to @list, notice: 'Restaurant was successfully created.'
    else
      render :new
    end
  end

  private

  def params_lists
    params.require(:list).permit(:name)
  end
end
