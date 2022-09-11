class ApplicationController < ActionController::Base
    include FamiliesHelper
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

# サインイン後のリダイレクト先をマイページへ
def after_sign_in_path_for(resource)
    user_path(current_user.id)  
end

# サインアウト後のリダイレクト先をトップページへ
def after_sign_out_path_for(resource)
    new_user_session_path
end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :family_id]) 
        devise_parameter_sanitizer.permit(:invite) { |u| u.permit(:email, :name, :family_id) }
        devise_parameter_sanitizer.permit(:accept_invitation) { |u| u.permit(:password, :password_confirmation, :invitation_token, :name, :family_id) }
    end
end
