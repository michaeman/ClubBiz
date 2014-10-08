json.array!(@invitations) do |invitation|
  json.extract! invitation, :id, :society_id, :event_id
  json.url invitation_url(invitation, format: :json)
end
