json.array!(@annoucements) do |annoucement|
  json.extract! annoucement, :id, :contents, :event_id, :society_id
  json.url annoucement_url(annoucement, format: :json)
end
