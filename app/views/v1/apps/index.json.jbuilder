json.array!(@apps) do |app|
  json.extract! app, :id, :name, :description, :host_group, :metadata, :repo, :hooks, :created_at, :updated_at
  json.url app_url(app, format: :json)
end
