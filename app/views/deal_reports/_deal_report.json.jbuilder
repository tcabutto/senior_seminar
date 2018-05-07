json.extract! deal_report, :id, :content, :reporter_id, :offense, :reportable_id, :created_at, :updated_at
json.url deal_report_url(deal_report, format: :json)
