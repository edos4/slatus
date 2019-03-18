require 'rails_helper'

RSpec.describe "API V1 Status Change", type: 'request' do
  describe "POST /api/v1/status/change" do
    before do
      post '/api/v1/status/change', params: { 
        :token => "xoxp-578938749364-580410928646-578939025172-a8478064ff3cb72d35146c953017a3c1", 
        :domain => "edoscorp",
        :status_text => "Busy in 8 mins",
        :status_emoji => ":moon:"
      }
    end

    it 'returns ok' do
      expect(response).to have_http_status(:ok)
    end
  end
end
