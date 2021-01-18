# require 'spec_helper'
# RSpec.describe 'Post' do           #
#   context 'before publication' do  # (almost) plain English
#     it 'cannot have comments' do   #
#       expect { Post.create.comments.create! }.to raise_error(ActiveRecord::RecordInvalid)  # test code
#     end
#   end
# end
require 'rails_helper'
RSpec.describe 'Querry string: computation', type: :request do
  # Test suite for GET /articles
  describe 'General computation should return 22' do
    # make HTTP get request before each example
    before { get 'http://localhost:3000/api/v2/scores/?sinister[]=2&years[]=2&pro[]=1' }

    it 'With the follozing params: sinister[]=2&years[]=2&pro[]=1' do
      expect(response.body).to match("{\"Bonus_Malus_Score\":22,\"status\":\"success\"}")
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'General computation should return 18' do
    # make HTTP get request before each example
    before { get 'http://localhost:3000/api/v2/scores/?sinister[]=1&years[]=1&pro[]=1' }

    it 'With the follozing params: sinister[]=1&years[]=1&pro[]=1' do
      expect(response.body).to match("{\"Bonus_Malus_Score\":18,\"status\":\"success\"}")
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

    describe 'General computation should return 12' do
    # make HTTP get request before each example
    before { get 'http://localhost:3000/api/v2/scores/?sinister[]=0&years[]=2&pro[]=1' }

    it 'With the follozing params: sinister[]=0&years[]=2&pro[]=1' do
      expect(response.body).to match("{\"Bonus_Malus_Score\":12,\"status\":\"success\"}")
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

    describe 'General computation should return 2' do
    # make HTTP get request before each example
    before { get 'http://localhost:3000/api/v2/scores/?sinister[]=0&years[]=12&pro[]=1' }

    it 'With the follozing params: sinister[]=0&years[]=12&pro[]=1' do
      expect(response.body).to match("{\"Bonus_Malus_Score\":2,\"status\":\"success\"}")
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'Minimum score of -2 no matter the years selected' do
    # make HTTP get request before each example
    before { get 'http://localhost:3000/api/v2/scores/?sinister[]=0&years[]=2222&pro[]=1' }

    it 'With the follozing params: sinister[]=0&years[]=2222&pro[]=1' do
      expect(response.body).to match("{\"Bonus_Malus_Score\":-2,\"status\":\"success\"}")
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

    describe 'Minimum score of -2 no matter the years selected' do
    # make HTTP get request before each example
    before { get 'http://localhost:3000/api/v2/scores/?sinister[]=0&years[]=23&pro[]=1' }

    it 'With the follozing params: sinister[]=0&years[]=23&pro[]=1' do
      expect(response.body).to match("{\"Bonus_Malus_Score\":-2,\"status\":\"success\"}")
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end

# testing the errors codes 1

RSpec.describe 'Error code 1: Missing params', type: :request do
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


# testing the errors codes 2

RSpec.describe 'Error code 2: Number only', type: :request do
  # Test suite for GET /articles

  describe 'error code two: Not an integer for sinister params' do
    # make HTTP get request before each example
    before { get 'http://localhost:3000/api/v2/scores/?sinister[]=Hello_World&years[]=1&pro[]=1' }

    it 'Return validation for error code 2: The querry string supports only integer' do
      expect(response.body).to match("{\"errors\":[{\"code\":\"2\",\"message\":\"Number only.\"}]}")
    end
    it 'returns status code 406: Not acceptable' do
      expect(response).to have_http_status(406)
    end
  end

  describe 'error code two: Not an integer for years params' do
    # make HTTP get request before each example
    before { get 'http://localhost:3000/api/v2/scores/?sinister[]=1&years[]=Hello_World&pro[]=1' }

    it 'Return validation for error code 2: The querry string supports only integer' do
      expect(response.body).to match("{\"errors\":[{\"code\":\"2\",\"message\":\"Number only.\"}]}")
    end
    it 'returns status code 406: Not acceptable' do
      expect(response).to have_http_status(406)
    end
  end

  describe 'error code two: Not an integer for pro params' do
    # make HTTP get request before each example
    before { get 'http://localhost:3000/api/v2/scores/?sinister[]=1&years[]=1&pro[]=Hello_World' }

    it 'Return validation for error code 2: The querry string supports only integer' do
      expect(response.body).to match("{\"errors\":[{\"code\":\"2\",\"message\":\"Number only.\"}]}")
    end
    it 'returns status code 406: Not acceptable' do
      expect(response).to have_http_status(406)
    end
  end

  describe 'error code two: Not an integer for all params' do
    # make HTTP get request before each example
    before { get 'http://localhost:3000/api/v2/scores/?sinister[]=Hello_World&years[]=Hello_World&pro[]=Hello_World' }

    it 'Return validation for error code 2: The querry string supports only integer' do
      expect(response.body).to match("{\"errors\":[{\"code\":\"2\",\"message\":\"Number only.\"}]}")
    end
    it 'returns status code 406: Not acceptable' do
      expect(response).to have_http_status(406)
    end
  end
end
    # testing the errors codes 3

RSpec.describe 'Error code 3: Missing value(s)', type: :request do
  # Test suite for GET /articles

  describe 'Error code 3: Missing value(s) of sinister params' do
    # make HTTP get request before each example
    before { get 'http://localhost:3000/api/v2/scores/?sinister[]=&years[]=1&pro[]=1' }

    it 'Return validation for error code 3: Value missing in the querry string' do
      expect(response.body).to match("{\"errors\":[{\"code\":\"3\",\"message\":\"Missing value(s)\"}]}")
    end
    it 'returns status code 406: Not acceptable' do
      expect(response).to have_http_status(406)
    end
  end

  describe 'Error code 3: Missing value(s) of years params' do
    # make HTTP get request before each example
    before { get 'http://localhost:3000/api/v2/scores/?sinister[]=1&years[]=&pro[]=1' }

    it 'Return validation for error code 3: Value missing in the querry string' do
      expect(response.body).to match("{\"errors\":[{\"code\":\"3\",\"message\":\"Missing value(s)\"}]}")
    end
    it 'returns status code 406: Not acceptable' do
      expect(response).to have_http_status(406)
    end
  end

  describe 'Error code 3: Missing value(s) of pro params' do
    # make HTTP get request before each example
    before { get 'http://localhost:3000/api/v2/scores/?sinister[]=1&years[]=1&pro[]=' }

    it 'Return validation for error code 3: Value missing in the querry string' do
      expect(response.body).to match("{\"errors\":[{\"code\":\"3\",\"message\":\"Missing value(s)\"}]}")
    end
    it 'returns status code 406: Not acceptable' do
      expect(response).to have_http_status(406)
    end
  end

  describe 'Error code 3: Missing all value(s)' do
    # make HTTP get request before each example
    before { get 'http://localhost:3000/api/v2/scores/?sinister[]=&years[]=&pro[]=' }

    it 'Return validation for error code 3: Value missing in the querry string' do
      expect(response.body).to match("{\"errors\":[{\"code\":\"3\",\"message\":\"Missing value(s)\"}]}")
    end
    it 'returns status code 406: Not acceptable' do
      expect(response).to have_http_status(406)
    end
  end
end

    # testing the errors codes 4

RSpec.describe 'Error code 4: Sinister value greater than 2', type: :request do
  # Test suite for GET /articles
  describe 'Error code 4: Sinister value greater than 2' do
    # make HTTP get request before each example
    before { get 'http://localhost:3000/api/v2/scores/?sinister[]=3&years[]=2&pro[]=1' }

    it 'returns a validation of the querry string' do
      expect(response.body).to match("{\"errors\":[{\"code\":\"4\",\"message\":\"Please contact the helpdesk if sinister greater than 2\"}]}")
    end
    it 'returns status code 406: Not acceptable' do
      expect(response).to have_http_status(406)
    end
  end
end

    # testing the errors codes 4

RSpec.describe 'Error code 5: Pro params should be 0 or 1', type: :request do
  # Test suite for GET /articles
  describe 'Error code 5: Pro params is equal to 2' do
    # make HTTP get request before each example
    before { get 'http://localhost:3000/api/v2/scores/?sinister[]=1&years[]=2&pro[]=2' }

    it 'returns a validation of the querry string' do
      expect(response.body).to match("{\"errors\":[{\"code\":\"5\",\"message\":\"Pro params should be 0 or 1\"}]}")
    end
    it 'returns status code 406: Not acceptable' do
      expect(response).to have_http_status(406)
    end
  end



end
