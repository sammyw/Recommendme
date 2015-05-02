json.array!(@tips) do |tip|
  json.extract! tip, :id, :name, :tip_type, :description, :price, :initally_recommended_by, :best_for, :address, :suburb, :postcode, :website, :user_id, :location_id
  json.url tip_url(tip, format: :json)
end
