json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :event_id, :user_id
  json.url ticket_url(ticket, format: :json)
end
