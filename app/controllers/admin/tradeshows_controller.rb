class Admin::TradeshowsController < Admin::ApplicationController
  def index
  end

  def new
    @tradshow = Tradeshow.new
  end
end
