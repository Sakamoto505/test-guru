# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale

  def default_url_options
    I18n.locale == I18n.default_locale ? {} : { lang: I18n.locale }
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

  def current_user_admin?
    current_user.is_a? Admin
  end
  helper_method :current_user_admin?

  protected

  def after_sign_in_path_for(_resource)
    if current_user_admin?
      admins_tests_path
    else
      root_path
    end
  end
end
