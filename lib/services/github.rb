require 'memoist'

class Github
  extend Memoist
  attr_accessor :token, :client
  def initialize(token = Env.github_api_token)
    @token, @client = token, Octokit::Client.new(:access_token => token)
  end

  def has_repo?(full_name)
    client.repository?(full_name)
  end

  def ensure_repo!(full_name, organization, privacy = "true")
    return true if has_repo?(full_name)

    if Rails.env.production?
      create_repo(full_name, organization, privacy)
    else
      raise("Repo doesn't exist. Creating Repo.")
    end
  end

  def create_repo!(full_name, organization, privacy = "true")
    client.create_repository(full_name, {organization: organization, private: privacy})
  end

  def teams(organization)
    client.organization_teams(organization)
  end
  memoize :teams

  def team_by_field(organization, value, field = :name)
    teams(organization).select { |t| t.public_send(field).to_s =~ /#{value}/i }.first
  end
  memoize :team_by_field

  def hooks(full_name)
    client.hooks(full_name)
  end
  memoize :hooks

  def create_hook!(full_name, hook_name, payload)
      # Payload
      # {
      #     :url => 'http://something.com/webhook',
      #     :content_type => 'json'
      #   },
      # {
      #       :events => ['push', 'pull_request'],
      #       :active => true
      #     }
    client.create_hook(full_name, hook_name, payload)
  end
end
