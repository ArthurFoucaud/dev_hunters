class DevsController < ApplicationController
  before_action :set_dev, only: [:show, :edit, :update, :destroy]

  def index
    @devs = Dev.all
  end

  def show
  end

  def new
    @dev = Dev.new
  end

  def create
    @dev = Dev.new(dev_params)
    @dev.user = current_user
    # raise
    if @dev.save
     redirect_to dev_path(@dev)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @dev.update(dev_params)
    if @dev.save
      redirect_to dev_path(@dev)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @dev.destroy
    redirect_to devs_path, status: :see_other
  end

  private

  def set_dev
    @dev = Dev.find(params[:id])
  end

  def dev_params
    params.require(:dev).permit(:name, :skill, :photo_url, :available)
  end
end
