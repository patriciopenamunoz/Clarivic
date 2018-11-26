json.extract! hostel, :id, :user_id, :name, :address, :description, :created_at, :updated_at
json.url hostel_url(hostel, format: :json)
