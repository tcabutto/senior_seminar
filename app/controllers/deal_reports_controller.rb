class DealReportsController < ApplicationController
  before_action :set_deal_report, only: [:show, :edit, :update, :destroy]

  # GET /deal_reports
  # GET /deal_reports.json
  def index
    @deal_reports = DealReport.all
  end

  # GET /deal_reports/1
  # GET /deal_reports/1.json
  def show
  end

  # GET /deal_reports/new
  def new
    @deal_report = DealReport.new
  end

  # GET /deal_reports/1/edit
  def edit
  end

  # POST /deal_reports
  # POST /deal_reports.json
  def create
    @deal_report = DealReport.new(deal_report_params)
    respond_to do |format|
      if @deal_report.save
        format.html { redirect_to catalog_index_path, notice: 'Deal report was successfully created.' }
        format.json { render :show, status: :created, location: @deal_report }
      else
        format.html { render :new }
        format.json { render json: @deal_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deal_reports/1
  # PATCH/PUT /deal_reports/1.json
  def update
    respond_to do |format|
      if @deal_report.update(deal_report_params)
        format.html { redirect_to @deal_report, notice: 'Deal report was successfully updated.' }
        format.json { render :show, status: :ok, location: @deal_report }
      else
        format.html { render :edit }
        format.json { render json: @deal_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deal_reports/1
  # DELETE /deal_reports/1.json
  def destroy
    @deal_report.destroy
    respond_to do |format|
      format.html { redirect_to deal_reports_url, notice: 'Deal report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deal_report
      @deal_report = DealReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deal_report_params
      params.require(:deal_report).permit(:content, :account_id, :offense, :deal_id)
    end
end
