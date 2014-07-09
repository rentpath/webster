# Webster

Web application that serves data relating to various applications.  Intended to be used for deployek and wiki_generator as central source of app specific information and metadata.

## High Level Design
### Register apps which have repo(public/private)
- webhooks

- teams/collaborators
- foreman host group  (ie for ag= ag-web)
  - query foreman to get info about all hosts that that app is deployed to.
- description
- arbitrary metadata (eventually hstore it?? for now json)

- Available as REST (html and as api)
- versioned (versionist gem)
  - https://github.com/bploetz/versionist
- start on v1, path and accept header
- /docs route on root (rspec apiblueprint.org)
  - https://github.com/playround/rspec_api_blueprint
- aglio to render docs
  - https://github.com/danielgtaylor/aglio
  - or alternate https://github.com/subosito/iglo
- For testing api
  - https://github.com/apiaryio/dredd
- If api blueprint is a horrible painful march
  - use this as fallback https://github.com/Apipie/apipie-rails

## Overview

```ruby
# Register New App
app = App.create(name: "ag", description: "ApartmentGuide", ...)

# == Schema Information
#
# Table name: apps
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  description  :text
#  host_group   :text
#  metadata     :text
#  created_at   :datetime
#  updated_at   :datetime
#  wiki_path    :string(255)
#  primary_team :string(255)
#

# Register the repo for app
app.repos.create(...)

# == Schema Information
#
# Table name: repos
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  organization :string(255)
#  full_name    :string(255)
#  public       :boolean          default(FALSE)
#  created_at   :datetime
#  updated_at   :datetime
#  app_id       :integer
#

# Register which existing hooks apply to the repo
app.repo.hooks.create(...)

# == Schema Information
#
# Table name: hooks
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  payload    :text
#  created_at :datetime
#  updated_at :datetime
#  repo_id    :integer
#
```




Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
