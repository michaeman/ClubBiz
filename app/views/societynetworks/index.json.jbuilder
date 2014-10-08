json.array!(@societynetworks) do |societynetwork|
  json.extract! societynetwork, :id, :society_id, :network_id
  json.url societynetwork_url(societynetwork, format: :json)
end
