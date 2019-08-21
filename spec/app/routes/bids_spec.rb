require_relative '../../spec_helper.rb'

RSpec.describe 'Bids', type: 'request' do
  describe 'GET /' do
    it 'returns ok' do
      get '/' 
      expect(last_response).to be_ok
    end
  end

  describe 'GET /calculate' do
    it 'returns winning bid' do
      get '/calculate'
      expect(last_response).to be_ok
    end
  end

  describe 'POST /bids' do
    context 'with valid params' do
      let(:valid_params) do
        {
          name: 'Alice',
          start_bid: 55,
          max_bid: 80,
          auto_increment: 2
        }.to_json
      end

      it 'creates a new bid' do
        post '/bids', valid_params, {'CONTENT_TYPE' => 'application/json'}
        expect(last_response).to be_ok
      end
    end

    context 'with invalid params' do
      let(:invalid_params) do
        {
          name: 'Alice'
        }.to_json
      end

      it 'returns error' do
        post '/bids', invalid_params, {'CONTENT_TYPE' => 'application/json'}
        expect(last_response.status).to eq(422)
      end
    end
  end
end
