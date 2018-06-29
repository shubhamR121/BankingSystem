class TransactionMailer < ApplicationMailer

  def amount_deducted(user, amount)

   @user = user
   @amount = amount
   @url = "http://localhost:3000/welcome/index"
   
   mail(to: @user.email, subject: "Welcome to Banking System")
   
  end

  def amount_credited(user, amount)

   @user = user
   @amount = amount
   @url = "http://localhost:3000/welcome/index"
   
   mail(to: @user.email, subject: "Welcome to Banking System")

  end


  def send_otp(current_user, otp)

    @current_user = current_user
    @otp = otp

    mail(to: @current_user.email, subject: "Welcome to Banking System")

  end
end
