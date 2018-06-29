class TransactionsController < ApplicationController
  def index
   @transactions_credit = Transaction.where(account_no: current_user.account.id)
   @transactions_debit = current_user.transactions

   @transactions = @transactions_credit.or(@transactions_debit).order("created_at")
   
   respond_to do |format|
     format.html
   end

 end

  def new
    @transaction = Transaction.new
  end

  def create
   @account_no = params[:transaction].values[0]
   amount1 = params[:transaction].values[1]

   account1 = current_user.account
   account2 = Account.find_by_account_no(@account_no)

   if beneficiary_present?
     account2.update_columns(balance: (account2.balance.to_i + amount1.to_i))
     account1.update_columns(balance: (account1.balance.to_i - amount1.to_i))
     Transaction.create!(account_no: account2.id, user_id: current_user.id, amount: amount1)

     TransactionMailer.amount_deducted(current_user, amount1).deliver
     TransactionMailer.amount_credited(account2.user, amount1).deliver

     redirect_to transactions_path
   else
     flash[:notice] = "This account number not present in your beneficiary"
     redirect_to new_transaction_path
   end
  end


  def beneficiary_present?
   current_user.beneficiaries.where(account_no: @account_no).first
  end

  def generate_otp

   otp = SecureRandom.random_number(9e3).to_i
   @account = Account.find(params[:id])   
   @account.update_columns(opt: otp)
   TransactionMailer.send_otp(current_user, otp).deliver

   respond_to do |format|
     format.js
   end

  end


end

































#  def generate_otp

#  end