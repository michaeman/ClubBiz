json.array!(@societyevents) do |societyevent|
  json.extract! societyevent, :id, :society_id, :event_id
  json.url societyevent_url(societyevent, format: :json)
end
