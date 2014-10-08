json.array!(@reports) do |report|
  json.extract! report, :id, :event_id
  json.url report_url(report, format: :json)
end
