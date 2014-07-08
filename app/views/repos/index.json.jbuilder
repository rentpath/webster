json.array!(@repos) do |repo|
  json.extract! repo, :id, :name, :organization, :full_name, :public
  json.url repo_url(repo, format: :json)
end
