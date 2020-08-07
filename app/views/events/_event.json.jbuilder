json.extract! event, :id, :name, :start_time, :end_time, :location, :radius, :description, :points, :category, :created_at, :updated_at
json.url event_url(event, format: :json)
