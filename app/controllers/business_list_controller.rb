class BusinessListController < ApplicationController
  def index
    @businesses = Business.order(:name).page params[:page]
  end
end