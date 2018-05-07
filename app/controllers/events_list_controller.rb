class EventsListController < ApplicationController
  before_action :authenticate_account!
  helper_method :sort_button, :sort_direction
  
  def index
    if(params[:query])
      @events = Event.all.joins("LEFT OUTER JOIN event_reports ON events.id = event_reports.event_id").where("name LIKE '%#{params[:query]}%' AND event_reports.id IS NULL ").order(sort_button+" " +sort_direction).page(1).per(10)
    else 
      @events = Event.joins("LEFT OUTER JOIN event_reports ON events.id = event_reports.event_id").where("event_reports.id IS NULL").order(sort_button+" " +sort_direction).page(1).per(10)
    end
  end

  
  private 
  def sort_button
    %w[name start cached_votes_up].include?(params[:button])? params[:button] : "name"
  end
  def sort_direction
    %w[asc desc].include?(params[:direction])? params[:direction]: "asc"
  end
end
