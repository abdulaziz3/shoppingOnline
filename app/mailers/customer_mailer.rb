class CustomerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.customer_mailer.welcome.subject
  #
  def welcome (customer)
	  @customer = customer
	  mail(:to => customer.email, :subject => " Welcome to our Store")
  end
  
  def successfulOrder (customer, order) 
    @customer = customer
    @order = order
    mail(:to => customer.email, :subject => " order is done")
  end

end
