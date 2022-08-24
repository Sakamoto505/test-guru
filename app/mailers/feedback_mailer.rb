class FeedbackMailer < ApplicationMailer
  def send_feedback(user, text)
    @user = user
    @text = text

    mail to: ENV['ADMIN_EMAIL']
  end
end
