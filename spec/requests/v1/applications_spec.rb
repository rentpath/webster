require 'spec_helper'

# RSpec.describe "Applications", :type => :request do
#   describe "GET /applications" do
#     it "works! (now write some real specs)" do
#       get applications_path
#       expect(response.status).to be(200)
#     end
#   end
# end

describe 'Applications Requests', type: :request do
  describe 'GET /v1/applications/{id}' do
    it 'responds with the requested app' do
      # app = Application.create(name: 'example_app')
      app = Application.create( name: 'example_app', host_group: 'ag-web')
      get "/v1/applications/#{app.id}.json", {}, {'Accept' => 'application/vnd.primedia.com; version=1', 'Content-Type' => 'application/json'}

      expect(response.status).to eq(200)
    end
  end
end

# describe V1::TestController do
#   it "should get v1" do
#     get '/application/1.json', {}, {'Accept' => 'application/vnd.primedia.com; version=1'}
#     assert_response 200
#     assert_equal "v1", response.body
#   end
# end
