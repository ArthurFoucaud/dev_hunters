class BookingsController < ApplicationController
  before_action :set_booking, only: :destroy
  before_action :set_dev, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.dev = @dev
    @booking.user = current_user
    if @booking.save
      redirect_to dev_path(@dev)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to dev_path(@booking.dev), status: :see_other
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
