require "rails_helper"

RSpec.describe "Home", type: :request do
  describe "GET /" do
    it "未ログインでもアクセスできる" do
      get root_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /how-to-play" do
    it "遊び方ページを表示する" do
      get how_to_play_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Citytoriの遊び方")
    end
  end
end
