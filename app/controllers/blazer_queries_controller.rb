class BlazerQueriesController < ApplicationController
    def new
        @blazer_queries = BlazerQueriesController.new
    end
    def create
        @blazer_queries = blazer_queries.new(blazer_queries_params)
    
        respond_to do |format|
          if @blazer_queries.save
            format.html { redirect_to @blazer_queries, notice: 'blazer_queries was successfully created.' }
            format.json { render :show, status: :created, location: @blazer_queries }
          else
            format.html { render :new }
            format.json { render json: @blazer_queries.errors, status: :unprocessable_entity }
          end
        end
      end
end