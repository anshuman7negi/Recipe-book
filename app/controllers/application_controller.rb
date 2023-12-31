class ApplicationController < ActionController::Base
    # protect_from_forgery with: :null_session
    before_action :update_allowed_parameters, if: :devise_controller?

    protected

    def update_allowed_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :passwrod, :current_password)}
    end
end
