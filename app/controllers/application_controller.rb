# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def authenticate_user!
    unless current_user
      cookies[:return_to_url] = request.url
      redirect_to login_path, alert: 'Are you a Guru? Verify your email and password, please'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def sign_in(user)
    session[:user_id] = user.id
  end
end
