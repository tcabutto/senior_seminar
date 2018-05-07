class BlazerDashboard < ApplicationController
    def new
        @blazer_dashboard = BlazerDashboard.new
    end

    def create
        @blazer_dashboard = blazer_dashboard.new(blazer_dashboard_params)
    
        respond_to do |format|
          if @blazer_dashboard.save
            format.html { redirect_to @blazer_dashboard, notice: 'blazer_dashboard was successfully created.' }
            format.json { render :show, status: :created, location: @blazer_dashboard }
          else
            format.html { render :new }
            format.json { render json: @blazer_dashboard.errors, status: :unprocessable_entity }
          end
        end
      end
end
