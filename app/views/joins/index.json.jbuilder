json.array!(@joins) do |join|
  json.extract! join, :id, :user_id, :society_id, :event_id
  json.url join_url(join, format: :json)
end
