require 'memoist'

StubbedDestructiveMethod = Class.new(StandardError)

class Github
  extend Memoist
  attr_accessor :token, :client
  def initialize(token = Env.github_api_token)
    @token, @client = token, Octokit::Client.new(access_token: token)
  end

  def has_repo?(full_name)
    client.repository?(full_name)
  end

  def ensure_repo!(full_name, organization, privacy = "true")
    return true if has_repo?(full_name)

    stub_outside_production("##{__callee__} issued with #{full_name} and #{options}") do
      create_repo(full_name, organization, privacy)
    end
  end

  def create_repo!(full_name, organization, team, privacy = "true")
    team_object = team_by_field(organization, team)
    options = {organization: organization, team_id: team_object.id, private: privacy}
    stub_outside_production("##{__callee__} issued with #{full_name} and #{options}") do
      client.create_repository(full_name, options)
    end
  end

  def teams(organization)
    client.organization_teams(organization)
  end
  memoize :teams

  def team_by_field(organization, value, field = :name)
    select_by_field.call(:teams, organization, field, value)
  end
  memoize :team_by_field

  def hooks(full_name)
    client.hooks(full_name)
  end
  memoize :hooks

  def hooks_by_field(full_name, value, field = :name)
    select_by_field.call(:hooks, full_name, field, value)
  end
  memoize :hooks_by_field

  def select_by_field
    ->(method, arg, field, value) do
      send(method, arg).select { |t| t.public_send(field).to_s =~ /#{value}/i }.first
    end
  end

  def create_hook!(full_name, hook)
    existing_hook = hooks_by_field(full_name, hook.name)
    stub_outside_production("##{__callee__} issued for repo: #{full_name} with #{hook}, and existing_hook #{existing_hook}") do
      if existing_hook
        hook.payload.merge!(existing_hook){ |key, v1, v2| v1 } # Prioritize first hash
        client.edit_hook(full_name, existing_hook.id, existing_hook.name, hook.payload)
      else
        client.create_hook(full_name, hook.name, hook.payload)
      end
    end
  end

  def stub_outside_production(msg, condition = Rails.env.production?)
    if condition
      yield
    else
      raise(StubbedDestructiveMethod, msg)
    end
  end
end
