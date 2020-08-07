json.extract! reward, :id, :name, :start_time, :end_time, :location, :description, :points, :category, :expiry_time, :expiry_quantity, :email, :created_at, :updated_at
json.url reward_url(reward, format: :json)
