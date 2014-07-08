json.array!(@apps) do |app|
  json.extract! app, :id, :name, :description, :host_group, :metadata
  json.url app_url(app, format: :json)
end
