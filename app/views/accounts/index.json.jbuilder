json.array!(@accounts) do |account|
  json.extract! account, :id, :name, :picture, :dob, :gender, :user_id
  json.url account_url(account, format: :json)
end
