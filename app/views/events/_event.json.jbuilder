json.extract! event, :id, :start_date, :end_date, :start_time, :end_time, :name, :address1, :address2, :city, :state, :zip, :description, :website_url, :rsvp, :image_url, :created_at, :updated_at
json.url event_url(event, format: :json)
