class StatisticsController < ApplicationController
    def index
        #if(params[:business_id])
         #   @business = Business.find(params[:business_id])
         #   @deals = @business.deals
        #elsif("id".instance_of? Chamber)
        #    @business = Business.all
        #    @deals = Deal.all
        #end

        @business = Business.all
        @deals = Deal.all
    end
end
