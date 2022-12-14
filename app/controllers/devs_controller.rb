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


    elsif params[:skill].present?
      @devs = Dev.where(skill: params[:skill])

    else
      @devs
    end

    @bookings = current_user.bookings
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


  def show
    authorize @dev
    @booking = Booking.new

    @review = Review.new

    if @dev.photo.attached?
      image = "http://res.cloudinary.com/dvtfwl0rn/image/upload/c_fill,h_300,w_400/v1/development/#{@dev.photo.key}"
    else
      image = @dev.photo_url
    end


    @marker = [{
      lat: @dev.latitude,
      lng: @dev.longitude,
      info_window: render_to_string(partial: "info_window", locals: {dev: @dev}),
      image_url: image
    }]
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
    params.require(:dev).permit(:name, :skill, :photo_url, :available, :photo, :address, :price)
  end
end
