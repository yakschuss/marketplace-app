class PublicController < ApplicationController
  def index
      @venues = Venue.has_address
      @tradeshows = Tradeshow.all.order("date DESC").paginate(page: params[:page], per_page: 5)
        if params[:search]
          @tradeshows = Tradeshow.search(params[:search]).order("date DESC").paginate(page: params[:page], per_page: 5)
        else
          @tradeshows = Tradeshow.all.order("date DESC").paginate(page: params[:page], per_page: 5)
        end

      @hash = Gmaps4rails.build_markers(@venues) do |venue, marker|
        info_window = "#{venue.address}"
        marker.lat venue.latitude
        marker.lng venue.longitude
        marker.infowindow info_window
        marker.json({:id => venue.id})
      #   marker.picture({
      #     "url" => "#{}",
      #     "width" =>  "36",
      #     "height" => "36"
      # })
      end
  end
end
