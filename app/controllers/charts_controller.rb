class ChartsController < ApplicationController
    def businesses_total_deals    
        render json: Business.group(:name).Deal.group(:business_id).count.chart_json
    end

    def businesses_total_deals_by_year
        render json: Deal.group_by_year(:business_id).count.chart_json
    end

    def businesses_total_deals_by_month
        render json: Deal.group_by_month(:business_id).count.chart_json
    end

    def businesses_total_deals_by_week
        render json: Deal.group_by_week(:business_id).count.chart_json
    end

    def businesses_total_deals_by_day
        render json: Deal.group_by_day(:business_id).count.chart_json
    end


    def businesses_total_popularity
        render json: Deal.group(:business_id).sum(:popularity).chart_json
    end

    def businesses_total_popularity_by_year
        render json: Deal.group(:business_id).group_by_year(:popularity).sum(:popularity).chart_json
    end

    def businesses_total_popularity_by_month
        render json: Deal.group(:business_id).group_by_month(:popularity).sum(:popularity).chart_json
    end

    def businesses_total_popularity_by_week
        render json: Deal.group(:business_id).group_by_week(:popularity).sum(:popularity).chart_json
    end

    def businesses_total_popularity_by_day
        render json: Deal.group(:business_id).group_by_day(:popularity).sum(:popularity).chart_json
    end


end