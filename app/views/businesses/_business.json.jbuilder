json.extract! business, :id, :name, :address1, :address2, :city, :state, :zip, :phone_number, :logo, :website_url, :status, :description, :created_at, :updated_at
json.url business_url(business, format: :json)
