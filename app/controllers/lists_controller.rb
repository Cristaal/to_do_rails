class ListsController < ApplicationController
  def new
    @list = List.new
    render :new
  end

  def create
    @list = List.new(params[:list])
    if @list.save
      redirect_to lists_path
    else
      render :new
    end
  end

  def update
    @list = List.find(params[:id])
    if @list.update(params[:list])
      redirect_to list_path(@list)
    else
      render :edit
    end
  end

  def index
    @lists = List.all
    render :index
  end

  def edit
    @list = List.find(params[:id])
    render :edit
  end

  def show
    @list = List.find(params[:id])
    render :show
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end
end
