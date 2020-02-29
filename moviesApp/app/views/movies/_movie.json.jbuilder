json.extract! movie, :id, :title, :rating, :release, :created_at, :updated_at
json.url movie_url(movie, format: :json)
