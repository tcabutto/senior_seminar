class BlazerDashboardQueriesController < ApplicationController
    def new
        @blazer_dashboard_queries = BlazerDashboardQueriesController.new
    end
    def create
        @blazer_dashboard_queries = blazer_dashboard_queries.new(blazer_dashboard_queries_params)
    
        respond_to do |format|
          if @blazer_dashboard_queries.save
            format.html { redirect_to @blazer_dashboard_queries, notice: 'blazer_queries was successfully created.' }
            format.json { render :show, status: :created, location: @blazer_dashboard_queries }
          else
            format.html { render :new }
            format.json { render json: @blazer_dashboard_queries.errors, status: :unprocessable_entity }
          end
        end
      end
end