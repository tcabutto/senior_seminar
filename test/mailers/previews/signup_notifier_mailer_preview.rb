# Preview all emails at http://localhost:3000/rails/mailers/signup_notifier_mailer
class SignupNotifierMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/signup_notifier_mailer/business
  def business
    SignupNotifierMailer.business
  end

  # Preview this email at http://localhost:3000/rails/mailers/signup_notifier_mailer/personnel
  def personnel
    SignupNotifierMailer.personnel
  end

end
