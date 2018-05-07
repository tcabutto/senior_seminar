class SignupNotifierMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.signup_notifier_mailer.business.subject
  #
  def business(account)
    @account = account

    mail to: account.email, subject: 'Moody Deals Business signup confirmation' do |format|
      format.html
    end
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.signup_notifier_mailer.personnel.subject
  #
  def personnel(account)
    @account = account

    mail to: account.email, subject: 'Moody Deals Personnel signup confirmation' do |format|
      format.html
    end
  end
end
