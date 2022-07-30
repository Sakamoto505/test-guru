# frozen_string_literal: true

class ApplicationController < ActionController::Base

  protected

  def after_sign_in_path_for(_resource)
    if current_user.is_a?(Admin)
      admin_tests_path
    else
      root_path
    end
  end
end
