json.extract! hostel, :id, :user_ids, :name, :address, :description,
                      :latitude, :longitude, :created_at, :updated_at
json.url hostel_url(hostel, format: :json)
