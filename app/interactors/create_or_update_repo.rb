class CreateOrUpdateRepo
  include Interactor

  def perform
    gh = Github.new
    gh.create_repo!(*context.values_at(:full_name, :organization, :team))
  end
end
