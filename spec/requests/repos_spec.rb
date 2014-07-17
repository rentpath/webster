require 'spec_helper'

describe 'Repos Requests', type: :request do
  describe 'GET /repos/{id}' do
    it 'responds with the requested repo' do
      repo = Repo.create( name: 'example_repo')
      get "/repos/#{repo.id}.json", {}, {'Content-Type' => 'app/json'}

      expect(response.status).to eq(200)
    end
  end
end
