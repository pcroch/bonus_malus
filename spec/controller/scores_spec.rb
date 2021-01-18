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
# initialize test data

    # Test suite for GET /articles
  describe 'GET /api/v2/scores' do
    # make HTTP get request before each example
    before { get 'http://localhost:3000/api/v2/scores/?sinister[]=2&years[]=2&pro[]=1' }

 it 'returns a validation failure message' do
        expect(response.body)
          .to match("{\"Bonus_Malus_Score\":22,\"status\":\"success\"}")
end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
