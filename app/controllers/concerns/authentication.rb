module Authentication
  extend ActiveSupport::Concern
  include ActionController::HttpAuthentication::Basic::ControllerMethods

  included do
    before_action :authenticate_user!
  end

  def authenticate_user!
    authenticate_with_http_basic do |username, password|
      @current_user = User.find_by(username: username)&.authenticate(password)
    end

    head :unauthorized unless current_user
  end

  def current_user
    @current_user
  end
end
