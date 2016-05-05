class Admin::TradeshowsController < Admin::ApplicationController
  def index
    @tradeshows = Tradeshow.all
  end

  def show
    @tradeshow = Tradeshow.find(params[:id])
  end

  def new
    @tradeshow = Tradeshow.new
  end

  def create
    @tradeshow = Tradeshow.create(tradeshow_params)
    if @tradeshow.save
      flash[:notice] = "Record was created successfully."
      redirect_to admin_tradeshow_path(@tradeshow)
    else
      flash[:error] = "There was an error creating the record. Please try again."
      render new
    end
  end

  def edit
    @tradeshow = Tradeshow.find(params[:id])
  end

  def update
    @tradeshow = Tradeshow.find(params[:id])
    @tradeshow.assign_attributes(tradeshow_params)


    if @tradeshow.save
      flash[:notice] = "Tradeshow updated."
      redirect_to admin_tradeshow_path(@tradeshow)
    else
      flash[:error] = "There was an error saving the changes. Please try again."
      render :edit
    end

  end


  def destroy
    @tradeshow = Tradeshow.find(params[:id])

    if @tradeshow.destroy
      flash[:notice] = "\"#{@tradeshow.title}\" was deleted successfully."
      redirect_to admin_tradeshows_path
    else
      flash[:error] = "There was an error deleting the Tradeshow."
      render :show
    end
  end

  private

  def tradeshow_params
    params.require(:tradeshow).permit(:title, :description, :location, :date)
  end
end
