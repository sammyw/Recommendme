json.array!(@plans) do |plan|
  json.extract! plan, :id, :name, :completed, :user_id, :tip_id
  json.url plan_url(plan, format: :json)
end
