module GoogleLoginHelper
  def mock_google_auth(user)
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] =
      OmniAuth::AuthHash.new(
        provider: user.provider,
        uid: user.uid,
        info: {
          email: user.email,
          name: user.name
        }
      )
  end

  module Request
    include GoogleLoginHelper

    def log_in(user)
      mock_google_auth(user)
      get '/auth/google_oauth2/callback'
    end
  end
end
