module StatisticsHelper
    def businesses_total_deals
        line_chart businesses_total_deals_charts_path
    end

    def businesses_total_deals_by_year
        column_chart businesses_total_deals_by_year_charts_path, label: "Deals", height: '800px'
    end

    def businesses_total_deals_by_month
        column_chart businesses_total_deals_by_month_charts_path, label: "Deals", height: '800px'

    end

    def businesses_total_deals_by_week
        column_chart businesses_total_deals_by_week_charts_path, label: "Deals", height: '800px'
    end

    def businesses_total_deals_by_day
        column_chart businesses_total_deals_by_day_charts_path, label: "Deals", height: '800px'

    end
#-------------end of methods for deals graphs-----------#

    def businesses_total_popularity
        column_chart businesses_total_popularity_charts_path, height: '500px'
    end

    def businesses_total_popularity_by_year
        column_chart businesses_total_popularity_by_year_charts_path, height: '500px'
    end

    def businesses_total_popularity_by_month
        column_chart businesses_total_popularity_by_month_charts_path, height: '500px', library: {
            yAxis: {
                crosshair: true,
                title: {
                    text: 'Count'
                }
            },
            xAxis: {
                crosshair: true,
                title: {
                    text: 'Months'
                }
            }
        }
    end

    def businesses_total_popularity_by_week
        column_chart businesses_total_popularity_by_week_charts_path, height: '500px'
    end

    def businesses_total_popularity_by_day
        column_chart businesses_total_popularity_by_day_charts_path, height: '500px'
    end



end
