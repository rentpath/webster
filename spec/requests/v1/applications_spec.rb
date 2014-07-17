require 'spec_helper'

describe 'Apps Requests', type: :request do
  describe 'GET /v1/apps/{id}' do
    it 'responds with the requested app' do
      app = App.create( name: 'example_app', host_group: 'ag-web')
      get "/v1/apps/#{app.id}.json", {}, {'Accept' => 'app/vnd.primedia.com; version=1', 'Content-Type' => 'app/json'}

      expect(response.status).to eq(200)
    end
  end
end
