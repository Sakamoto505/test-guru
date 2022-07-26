# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to (cookies.delete :return_to_url) || tests_path
    else
      flash.now[:alert] = 'Are you Guru? Verify your email and password please.'
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path, notice: 'Good luck boooooy!'
  end
end
