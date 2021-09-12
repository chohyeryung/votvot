class ApplicationController < ActionController::Base
    skip_forgery_protection
    # protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        added_attrs = [:nickname, :email, :password, :password_confirmation, :profile, :remember_me]

        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end

    # 로그인하지 않은 유저가 접근 시 로그인창으로 이동
    def authenticate
        redirect_to new_user_session_path if !user_signed_in?
    end
    
end
