class Admin::VenuesController < Admin::ApplicationController
  def index
    @venues = Venue.all
  end

  def new
    @venue = Venue.new
  end
end
