json.array!(@societies) do |society|
  json.extract! society, :id, :title, :description, :code
  json.url society_url(society, format: :json)
end
