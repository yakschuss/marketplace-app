class Admin::TradeshowsController < Admin::ApplicationController
  def index
  end

  def new
    @tradeshow = Tradeshow.new
  end
end
