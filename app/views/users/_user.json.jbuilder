json.extract! user, :id, :name, :username, :profile_pic, :accumulated_total_points, :athletics_points, :dining_points, :netid, :email, :created_at, :updated_at, :accumulated_athletics_points, :accumulated_dining_points, :primary_affiliation
json.url user_url(user, format: :json)
