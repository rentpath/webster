class SetupHooks
  include Interactor

  def perform
    gh = Github.new
    gh.create_hook!(context.values_at(:full_name, :hook))
  end
end
