json.array!(@locations) do |location|
  json.extract! location, :id, :country, :city, :region
  json.url location_url(location, format: :json)
end
