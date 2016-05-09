class PublicController < ApplicationController
  def index
      @venues = Venue.all
      @tradeshows = Tradeshow.all
      @hash = Gmaps4rails.build_markers(@venues) do |venue, marker|
        marker.lat venue.latitude
        marker.lng venue.longitude
        #marker.infowindow venue.name how to get both?
        marker.infowindow venue.address
      end
  end
end
