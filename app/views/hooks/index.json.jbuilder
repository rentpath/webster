json.array!(@hooks) do |hook|
  json.extract! hook, :id, :name, :payload
  json.url hook_url(hook, format: :json)
end
