require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { create(:user) }

  describe 'GET /api/v1/users' do
    it 'succeeds to aquire the index' do
      get api_v1_users_path
      expect(response).to have_http_status(200)
    end
  end
end
