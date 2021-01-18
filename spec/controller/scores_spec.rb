# require 'spec_helper'
# RSpec.describe 'Post' do           #
#   context 'before publication' do  # (almost) plain English
#     it 'cannot have comments' do   #
#       expect { Post.create.comments.create! }.to raise_error(ActiveRecord::RecordInvalid)  # test code
#     end
#   end
# end
require 'rails_helper'
RSpec.describe 'Score  API', type: :request do
  # Test suite for GET /articles
  describe 'GET /api/v2/scores' do
    # make HTTP get request before each example
    before { get 'http://localhost:3000/api/v2/scores/?sinister[]=2&years[]=2&pro[]=1' }

    it 'returns a validation of the querry string' do
      expect(response.body).to match("{\"Bonus_Malus_Score\":22,\"status\":\"success\"}")
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end

# testing the errors codes

RSpec.describe 'Testing the errors code 1  API', type: :request do
  # Test suite for GET /articles

  describe 'error code one: missing pro params' do
    # make HTTP get request before each example
    before { get 'http://localhost:3000/api/v2/scores/?sinister[]=2&years[]=2' }

    it 'Return validation for error code 1: pro params missing' do
      expect(response.body).to match("{\"errors\":[{\"code\":\"1\",\"message\":\"Missing params\"}]}")
    end
    it 'returns status code 406: Not acceptable' do
      expect(response).to have_http_status(406)
    end
  end

  describe 'error code one: missing years params' do
    # make HTTP get request before each example
    before { get 'http://localhost:3000/api/v2/scores/?sinister[]=2&pro[]=1' }

    it 'Return validation for error code 1: years params missing' do
      expect(response.body).to match("{\"errors\":[{\"code\":\"1\",\"message\":\"Missing params\"}]}")
    end
    it 'returns status code 406: Not acceptable' do
      expect(response).to have_http_status(406)
    end
  end

  describe 'error code one: missing sinister params' do
    # make HTTP get request before each example
    before { get 'http://localhost:3000/api/v2/scores/?years[]=2&pro[]=1' }

    it 'Return validation for error code 1: sinister params missing' do
      expect(response.body).to match("{\"errors\":[{\"code\":\"1\",\"message\":\"Missing params\"}]}")
    end
    it 'returns status code 406: Not acceptable' do
      expect(response).to have_http_status(406)
    end
  end

  describe 'error code one: missing all params' do
    # make HTTP get request before each example
    before { get 'http://localhost:3000/api/v2/scores' }

    it 'Return validation for error code 1: sinister params missing' do
      expect(response.body).to match("{\"errors\":[{\"code\":\"1\",\"message\":\"Missing params\"}]}")
    end
    it 'returns status code 406: Not acceptable' do
      expect(response).to have_http_status(406)
    end
  end
end
