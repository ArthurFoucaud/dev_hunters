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

    @user = current_user
    @devs = Dev.where(user: current_user)
    @devs.each do |d|
      @name = d.name
      @dev = d
    end

    @dev.bookings.each do |booking|
    @starting_time = booking.starting_time
    @ending_time = booking.ending_time
    @price = @dev.price
    @statut = booking.status_seller
    end


    @devs = current_user.booked_devs
    @markers = @devs.map do |dev|
      if dev.photo.attached?
        image = "http://res.cloudinary.com/dvtfwl0rn/image/upload/c_fill,h_300,w_400/v1/development/#{dev.photo.key}"
      else
        image = dev.photo_url
      end
      {
        lat: dev.latitude,
        lng: dev.longitude,
        info_window: render_to_string(partial: "info_window", locals: {dev: dev}),
        image_url: image
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
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to booking_path, status: :see_other
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
