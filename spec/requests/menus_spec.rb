require 'rails_helper'

RSpec.describe "Menus", type: :request do
  describe "GET /nakama" do
    it "returns http success" do
      get "/menus/nakama"
      expect(response).to have_http_status(:success)
    end
  end

end
