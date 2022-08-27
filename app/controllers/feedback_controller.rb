class FeedbackController < ApplicationController

  before_action :authenticate_user!

  def new
  end


  def create
    FeedbackMailer.send_feedback(current_user, feedback_text).deliver_now
    redirect_to root_path

  end

  private
  def feedback_text
    params.require(:body)
  end
end
