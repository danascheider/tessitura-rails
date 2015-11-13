require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "reroutes to the Devise controller" do
      get users_path
      expect(response).to have_http_status(302)
    end
  end
end
