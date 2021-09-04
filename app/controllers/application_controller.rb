class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        added_attrs = [ :email, :name, :password, :password_confirmation, :image, :address, :job, :genre, :profile ]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
        devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
        # サインアップ時にnameのストロングパラメータを追加
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        # アカウント編集の時にnameとprofileのストロングパラメータを追加
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile])
    end

end
