class DealsController < ApplicationController
  
  skip_before_action :verify_authenticity_token
  before_action :set_deal, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_account!
  

  def pundit_user
    current_account
  end

  
  #print method for each deals qr code
  def print 
      @deal = Deal.find(params[:deal_id])
      @deal_qr = @deal.qr_code
      @qr_code = RQRCode::QRCode.new(@deal_qr)
      @svg = @qr_code.as_svg(offset: 0, color:'000', shape_rendering: 'cripsEdges', module_size: 3)
      
      #authorize @deal
  end
  
  #method to create a transaction 
  def redeem
    #need to change this so that qr code isnt represented as id. makes things confusing
    @deal = Deal.where(:qr_code => params[:deal_id]).first()
    @transaction = Transaction.new
    @transaction.deal_id = @deal.id
    @transaction.account_id = current_account.id
    
    #authorize @deal

    respond_to do |format|
      #frequency conditions will be added here
      if @transaction.save
        format.html{redirect_to deals_url, notice: "Your deal has been successfully added"}
        format.json{ head :no_content }
      else
        format.html{redirect_to deals_url, notice: "There was an error trying to add your deal"}
        format.json{ head :no_content }
      end
    end
  end


  # GET /deals
  # GET /deals.json
  def index
    if(params[:business_id])
      @business = Business.find(params[:business_id])
      @deals = @business.deals.order('popularity desc').page(params[:page]).per(10)
    else 
      @deals = Deal.joins("LEFT OUTER JOIN deal_reports ON deals.id = deal_reports.deal_id").where("deal_reports.id IS NULL")
    end

    #authorize Deal
    #@deals = policy_scope(Deal)
  end

  # GET /deals/1
  # GET /deals/1.json
  def show
    authorize @deal
    @deals = policy_scope(Deal)
    @businesses = @deal.business
    @hash = Gmaps4rails.build_markers(@businesses) do |business, marker|
      marker.lat business.latitude
      marker.lng business.longitude
    end
  end

  # GET /deals/new
  def new
    @business = Business.find(params[:business_id])
    @deal = Deal.new
    authorize @deal
  end

  # GET /deals/1/edit
  def edit
    authorize @deal
  end

  # POST /deals
  # POST /deals.json
  def create
    @business = Business.find(params[:business_id])
    @deal = @business.deals.new(deal_params)
    authorize @deal

    respond_to do |format|
      if @deal.save
        format.html { redirect_to @deal, notice: 'Deal was successfully created.' }
        format.json { render :show, status: :created, location: @deal }
      else
        format.html { render :new }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deals/1
  # PATCH/PUT /deals/1.json
  def update
    #authorize @deal
    respond_to do |format|
      if @deal.update(deal_params)
        format.html { redirect_to @deal, notice: 'Deal was successfully updated.' }
        format.json { render :show, status: :ok, location: @deal }
      else
        format.html { render :edit }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deals/1
  # DELETE /deals/1.json
  def destroy
    authorize @deal
    @deal.destroy
    respond_to do |format|
      format.html { redirect_to deals_url, notice: 'Deal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def favorite
    @deal = Deal.find(params[:id])
    @deal.liked_by current_account
    redirect_back(fallback_location: catalog_index_url)
  end

  def unfavorite
    @deal = Deal.find(params[:id])
    @deal.unliked_by current_account
    redirect_back(fallback_location: catalog_index_url)
  end
  

  def upvote
    @deal = Deal.find(params[:deal_id])
    
    @vs = params[:voteState]
    if current_account.voted_for? @deal, vote_scope: 'popularity' #check if the vote exist for upvote
      if @vs == 1 #if vote state is 1 then unlike the deal - popularity and return votestate 0
        @deal.unliked_by current_account, vote_scope: 'popularity'
        
          @deal.popularity = @deal.popularity - 1
          @vs = 0
      end

    elsif @vs == -1
      @deal.unvote_by current_account, vote_scope: :popularity
      @deal.liked_by  current_account,  vote_scope: 'popularity'
      if @deal.vote_registered? 
        @deal.popularity = @deal.popularity + 2
        @vs = 1
      end

    else  
      @deal.liked_by current_account, vote_scope: 'popularity'
      if @deal.vote_registered?
        @deal.popularity = @deal.popularity + 1
        @vs = 1
      end
    end
    
    @deal.update_attributes(:popularity => @deal.popularity)

    if @deal.save
      render json: {voteState: @vs}
    end 
  end
  
  def downvote
    @deal = Deal.find(params[:deal_id])
    
    @vs = params[:voteState]
    if current_account.voted_down_on? @deal, vote_scope: 'popularity'
      if @vs == -1
        @deal.undisliked_by current_account, vote_scope: 'popularity'
        
          @deal.popularity = @deal.popularity + 1
          @vs = 0
      end

    elsif @vs == 1 
      @deal.unliked_by current_account, vote_scope: 'popularity'
      @deal.disliked_by current_account, :vote_scope => 'popularity'
      if @deal.vote_registered? 
        @deal.popularity = @deal.popularity - 2
        @vs = -1
      end
    else 
      @deal.disliked_by current_account, vote_scope: 'popularity'
      if @deal.vote_registered?
        @deal.popularity = @deal.popularity - 1
        @vs = -1
      end
    end
    @deal.update_attributes(:popularity => @deal.popularity)

    if @deal.save
      render json: {voteState: @vs}
    end
  end
  def comments
    @deal = Deal.find(params[:deal_id])
  end
  
  def favorite
    @deal = Deal.find(params[:deal_id])
    
    @fs = params[:favState]
    
    if current_account.voted_up_on? @deal, vote_scope: 'favorite'
      @deal.unliked_by current_account, vote_scope: 'favorite'
      @fs = 0
    else 
      @deal.liked_by current_account, vote_scope: 'favorite'
    end
    return @fs
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deal
      @deal = Deal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deal_params
      params.require(:deal).permit(:name, :description, :category, :start_date, :end_date)
    end
end
