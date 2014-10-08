json.array!(@adminevents) do |adminevent|
  json.extract! adminevent, :id, :admin_id, :event_id
  json.url adminevent_url(adminevent, format: :json)
end
