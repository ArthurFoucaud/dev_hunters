class DashboardsController < ApplicationController
  def dashboard
    raise
    @bookings = policy_scope(Booking)
  end
end
