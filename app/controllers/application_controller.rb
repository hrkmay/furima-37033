class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth
  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'hiro' && password == '8492'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :first_name, :last_name, :first_kana_name, :last_kana_name, :birth])
  end
end
