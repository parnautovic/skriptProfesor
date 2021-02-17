json.extract! friends_app, :id, :first_name, :last_name, :email, :phone, :twitter, :created_at, :updated_at
json.url friends_app_url(friends_app, format: :json)
