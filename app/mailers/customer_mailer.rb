class CustomerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.customer_mailer.welcome.subject
  #
  def welcome (customer)
    @customer = customer
	mail(:to => customer.email, :subject => " Welcome to Shopping Store")
  end
end
