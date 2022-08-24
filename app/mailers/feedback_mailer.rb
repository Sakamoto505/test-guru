class FeedbackMailer < ApplicationMailer
  def send_feedback(user, text)
    @user = user
    @text = text

    mail to: Admin.first.email
  end
end
