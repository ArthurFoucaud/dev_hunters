class DashboardsController < ApplicationController
  def index
    raise
    @bookings = policy_scope(Booking)
  end
end
