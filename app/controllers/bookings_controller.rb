class BookingsController < ApplicationController
  before_action :set_booking, only: :destroy
  before_action :set_dev, only: [:new, :create]
  def index
    @bookings = policy_scope(Booking)
    if params[:query].present?
      sql_query = <<~SQL
      devs.name  ILIKE :query
      OR devs.skill ILIKE :query
    SQL
    @bookings = Booking.joins(:dev).where(sql_query, query: "%#{params[:query]}%")
    else
      @bookings
    end
    @devs = Dev.all
    @markers = @devs.geocoded.map do |dev|

      {
        lat: dev.latitude,
        lng: dev.longitude
      }
    end
  end

  def new
    @booking = Booking.new
    authorize @booking
    @dev
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.dev = @dev
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to dev_path(@dev)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    raise
    authorize @booking
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:starting_time, :ending_time)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_dev
    @dev = Dev.find(params[:dev_id])
  end
end
