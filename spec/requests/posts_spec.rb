require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "redirects to root" do
      get posts_path
      expect(response).to have_http_status(301)
    end
  end
end
