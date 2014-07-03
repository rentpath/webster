json.array!(@applications) do |application|
  json.extract! application, :id, :name, :description, :host_group, :metadata
  json.url application_url(application, format: :json)
end
