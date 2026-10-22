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
      expect(response.body).to include("ホームからGoogleアカウントでログインして、散歩を始められます。")
    end

    context "ログイン済みの場合" do
      let(:user) { FactoryBot.create(:user) }

      before do
        OmniAuth.config.test_mode = true
        OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
          provider: user.provider, uid: user.uid,
          info: { email: user.email, name: user.name }
        )
        get "/auth/google_oauth2/callback"
      end

      it "自分の進行中の散歩があれば再開を案内する" do
        FactoryBot.create(:word_chain_walk, user: user)
        get how_to_play_path
        expect(response.body).to include("進行中の散歩があります。ホームから続きを再開できます。")
        expect(response.body).not_to include("ホームから新しい散歩を始められます。")
      end

      it "散歩がなければ新しい散歩を案内する" do
        get how_to_play_path
        expect(response.body).to include("ホームから新しい散歩を始められます。")
      end

      it "完了した散歩や他人の進行中の散歩では再開を案内しない" do
        FactoryBot.create(:word_chain_walk, user: user, finished_at: Time.current)
        FactoryBot.create(:word_chain_walk)
        get how_to_play_path
        expect(response.body).to include("ホームから新しい散歩を始められます。")
        expect(response.body).not_to include("進行中の散歩があります。")
      end
    end
  end
end
