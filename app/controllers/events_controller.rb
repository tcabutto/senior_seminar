class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_account!

  def pundit_user
    current_account
  end
  
  # GET /events
  # GET /events.json
  def index
    if(params[:business_id])
      @business = Business.find(params[:business_id])
      @events = @business.events.page(params[:page]).per(10)
    else 
      @events = Event.joins("LEFT OUTER JOIN event_reports ON events.id = event_reports.event_id").where("event_reports.id IS NULL")
    end

    authorize Event
  end

  # GET /events/1
  # GET /events/1.json
  def show
    authorize @event
    @events = policy_scope(Event)
    @events_map = Event.find(params[:id])
    @hash = Gmaps4rails.build_markers(@events_map) do |event_map, marker|
      marker.lat event_map.latitude
      marker.lng event_map.longitude
    end
  end

  # GET /events/new
  def new
    @business = Business.find(params[:business_id])
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    authorize @event
  end

  # POST /events
  # POST /events.json
  def create
    @business = Business.find(params[:business_id])
    @event = @business.events.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def rsvp
    @event = Event.find(params[:id])
    @event.liked_by current_account
    redirect_back(fallback_location: events_list_index_url)
  end

  def unrsvp
    @event = Event.find(params[:id])
    @event.unliked_by current_account
    redirect_back(fallback_location: events_list_index_url)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:start, :end, :name, :address1, :address2, :city, :state, :zip, :description, :website_url, :rsvp, :image_url, :location)
    end
end
