require 'rails_helper'

RSpec.describe "Livechats", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/livechats/new"
      expect(response).to have_http_status(:success)
    end
  end

end
