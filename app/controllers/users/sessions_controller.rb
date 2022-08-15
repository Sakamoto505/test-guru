# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    before_action :configure_permitted_parameters

    def create
      super
      flash[:notice] = "Welcome, #{current_user.first_name} #{current_user.last_name}"
    end

    def after_sign_in_path_for(_resource)
      current_user_admin? ? admins_tests_path : tests_path
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
    end
  end
end
