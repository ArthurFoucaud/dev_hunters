class DevsController < ApplicationController
  before_action :set_dev, only: [:show, :edit, :update, :destroy]

  def index
    @devs = policy_scope(Dev)
    if params[:query].present?
      sql_query = <<~SQL
      devs.name  ILIKE :query
      OR devs.skill ILIKE :query
    SQL
    @devs = Dev.where(sql_query, query: "%#{params[:query]}%")
    else
      @devs
    end

    @markers = @devs.geocoded.map do |dev|
      {
        lat: dev.latitude,
        lng: dev.longitude
      }
    end

    @bookings = current_user.bookings
  end

  def show
    authorize @dev
    @booking = Booking.new
  end

  def new
    @dev = Dev.new
    authorize @dev
  end

  def create
    @dev = Dev.new(dev_params)
    @dev.user = current_user
    authorize @dev
    if @dev.save
      redirect_to dev_path(@dev)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @dev
  end

  def update
    @dev.update(dev_params)
    authorize @dev
    if @dev.save
      redirect_to dev_path(@dev)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @dev.destroy
    authorize @dev
    redirect_to devs_path, status: :see_other
  end

  private

  def set_dev
    @dev = Dev.find(params[:id])
  end

  def dev_params
    params.require(:dev).permit(:name, :skill, :photo_url, :available, :photo)
  end
end
