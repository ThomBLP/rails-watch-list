class ListsController < ApplicationController
  before_action :setlist, only: [:show]
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save!
      redirect_to lists_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def setlist
    @list = List.find(params[:id])
  end
end
