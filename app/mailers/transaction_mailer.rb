class TransactionMailer < ApplicationMailer

  def amount_deducted(user, amount)

   @user = user
   @amount = amount
   @url = "http://localhost:3000/welcome/index"
   
   mail(to: @user.email, subject: "Welcome to Banking System")

   byebug
  end

  def amount_credited(user, amount)

   @user = user
   @amount = amount
   @url = "http://localhost:3000/welcome/index"
   
   mail(to: @user.email, subject: "Welcome to Banking System")

  end

end
