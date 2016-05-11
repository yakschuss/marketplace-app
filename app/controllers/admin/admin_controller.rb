class Admin::AdminController < Admin::ApplicationController
  def show
    @disable_search = true
  end
end
