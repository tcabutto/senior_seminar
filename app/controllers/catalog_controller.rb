class CatalogController < ApplicationController
  before_action :authenticate_account!
  
  def index
    #@deals = Deal.order('popularity desc')
    ahoy.track "Logged in and viewed home page.";
    @current = current_account
    @deals = nil
    if(params[:query])
      if (params[:category].to_i == 8)
        @deals = Deal.joins("LEFT OUTER JOIN deal_reports ON deals.id = deal_reports.deal_id").all.where("name LIKE '%#{params[:query]}%' AND deal_reports.id IS NULL ").order(params[:sort_by] + ' '+ params[:direction]).map{|d|  [:deal =>d,:voteState => d.checkvote(d.id,@current), :favState =>d.checkfav(d.id,@current), :logo => d.getlogo(d.id), :business => d.getbusinessname(d.id)]}
      else 
        @deals = Deal.joins("LEFT OUTER JOIN deal_reports ON deals.id = deal_reports.deal_id").where("name LIKE '%#{params[:query]}%' AND category = '#{params[:category]}' AND deal_reports.id IS NULL ").order(params[:sort_by] + ' '+ params[:direction]).map{|d|  [:deal =>d,:voteState => d.checkvote(d.id,@current), :favState =>d.checkfav(d.id,@current), :logo => d.getlogo(d.id), :business => d.getbusinessname(d.id)]}
      end
      
    else
      @deals = Deal.joins("LEFT OUTER JOIN deal_reports ON deals.id = deal_reports.deal_id").where("deal_reports.id IS NULL").order('popularity desc').map{|d|  [:deal =>d,:voteState => d.checkvote(d.id,@current), :favState =>d.checkfav(d.id,@current), :logo => d.getlogo(d.id), :business => d.getbusinessname(d.id)]}
    end
    respond_to do |format|
      format.html{}
      #format.json{render json: Deal.order(:popularity)}
       format.json{render json: @deals}
    end
  end

  def pundit_user
    current_account
  end
  private 
  def sort_by
    %w(popularity name date).include?(params[:sort_by]) ? params[:sort_by] : 'popularity'
  end
  
  def direction
    %w(asc desc).include? params[:direction] ? params[:direction] : 'asc'
  end

  def about
    @businesses = Business.all
  end
end
