json.extract! car, :id, :firstname, :lastname, :manufacturer, :cost, :description, :color, :created_at, :updated_at
json.url car_url(car, format: :json)
