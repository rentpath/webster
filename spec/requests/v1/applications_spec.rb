require 'spec_helper'

# RSpec.describe "Apps", :type => :request do
#   describe "GET /apps" do
#     it "works! (now write some real specs)" do
#       get apps_path
#       expect(response.status).to be(200)
#     end
#   end
# end

describe 'Apps Requests', type: :request do
  describe 'GET /v1/apps/{id}' do
    it 'responds with the requested app' do
      # app = App.create(name: 'example_app')
      app = App.create( name: 'example_app', host_group: 'ag-web')
      get "/v1/apps/#{app.id}.json", {}, {'Accept' => 'app/vnd.primedia.com; version=1', 'Content-Type' => 'app/json'}

      expect(response.status).to eq(200)
    end
  end
end

# describe V1::TestController do
#   it "should get v1" do
#     get '/app/1.json', {}, {'Accept' => 'app/vnd.primedia.com; version=1'}
#     assert_response 200
#     assert_equal "v1", response.body
#   end
# end
