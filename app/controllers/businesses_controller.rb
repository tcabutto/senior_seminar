class BusinessesController < ApplicationController
  
  before_action :set_business, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_account!

  # GET /businesses
  # GET /businesses.json
  def index
    @businesses = Business.all

    authorize Business
  end

  # GET /businesses/1
  # GET /businesses/1.json
  def show
    @businesses = Business.find(params[:id])
    @hash = Gmaps4rails.build_markers(@businesses) do |business, marker|
      marker.lat business.latitude
      marker.lng business.longitude
    end
  end

  # GET /businesses/new
  def new
    @business = Business.new
  end

  # GET /businesses/1/edit
  def edit
    authorize @business
  end

  # POST /businesses
  # POST /businesses.json
  def create
    @business = Business.new(business_params)

    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Business was successfully created.' }
        format.json { render :show, status: :created, location: @business }
      else
        format.html { render :new }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /businesses/1
  # PATCH/PUT /businesses/1.json
  def update
    authorize @business
    respond_to do |format|
      if @business.update(business_params)
        format.html { redirect_to @business, notice: 'Business was successfully updated.' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :edit }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /businesses/1
  # DELETE /businesses/1.json
  def destroy
    @business.destroy
    respond_to do |format|
      format.html { redirect_to businesses_url, notice: 'Business was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  

  def pundit_user
    current_account
  end

  def report
    @business = Business.find(params[:id])
    @report = Report.new.reportable_type("Business")
    @report.account_id = current_account.accountable.id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_params
      params.require(:business).permit(:name, :address1, :address2, :city, :state, :zip, :phone_number, :logo, :website_url, :description)
    end
end
