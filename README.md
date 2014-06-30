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


Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
