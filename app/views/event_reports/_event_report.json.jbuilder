json.extract! event_report, :id, :content, :reporter_id, :offense, :reportable_id, :created_at, :updated_at
json.url event_report_url(event_report, format: :json)
