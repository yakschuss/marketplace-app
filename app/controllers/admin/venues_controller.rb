class Admin::VenuesController < Admin::ApplicationController
  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.create(venue_params)
    if @venue.save
      flash[:notice] = "Record was created successfully."
      redirect_to admin_venue_path(@venue)
    else
      flash[:error] = "There was an error creating the record. Please try again."
      render new
    end
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:id])
    @venue.assign_attributes(venue_params)


    if @venue.save
      flash[:notice] = "Venue updated."
      redirect_to admin_venue_path(@venue)
    else
      flash[:error] = "There was an error saving the changes. Please try again."
      render :edit
    end

  end


  def destroy
    @venue = Venue.find(params[:id])

    if @venue.destroy
      flash[:notice] = "\"#{@venue.name}\" was deleted successfully."
      redirect_to admin_venues_path
    else
      flash[:error] = "There was an error deleting the Venue."
      render :show
    end
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :address, :latitude, :longitude)
  end
end
