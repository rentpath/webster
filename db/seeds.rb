# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'yaml'
require 'json'

yaml = YAML.load <<-YML
---
ag:
  id: ag
  github_repository: ag
  name: Apartment Guide
  wiki_path: IDG/Releases/Web/ApartmentGuide
ag_console:
  id: ag_console
  github_repository: ag-console
  name: AG Sites Console
  wiki_path: IDG/Releases/B2B_Services/AG_Sites_Console
ag_console_server:
  id: ag_console_server
  github_repository: ag-console-server
  name: AG Sites Server
  wiki_path: IDG/Releases/B2B_Services/AG_Sites_Server
portal:
  id: portal
  github_repository: portal
  name: Portal
  wiki_path: IDG/Releases/B2B_Services/Portal
randr:
  id: randr
  github_repository: randr
  name: Ratings and Reviews Service (randr)
  wiki_path: IDG/Releases/B2B_Services/Randr
rnr_ui:
  id: rnr_ui
  github_repository: rnr_ui
  name: Ratings and Reviews UI (rnr_ui)
  wiki_path: IDG/Releases/B2B_Services/Rating_Reviews
max_leases_2:
  id: max_leases_2
  github_repository: maxleases2
  name: Max Leases 2
  wiki_path: IDG/Releases/B2B_Services/MaxLeases2
  YML

  yaml.values.each do |rec|
    metadata = {wiki_generator: {template_path: rec["wiki_path"],
                                 github_repository: rec["github_repository"]}}.to_json
    App.create(name: rec["id"],
                    description: rec["name"],
                    metadata: metadata)

  end
