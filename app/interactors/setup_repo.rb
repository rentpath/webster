class SetupRepo
  include Interactor::Organizer

  # Requires context have following keys
  # full_name, hook obj, organization, team
  organize [
            CreateOrUpdateRepo,
            SetupHooks,
           ]
end
