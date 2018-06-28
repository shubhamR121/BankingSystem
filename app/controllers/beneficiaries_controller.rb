class BeneficiariesController < ApplicationController

 def index
   @beneficiaries = current_user.beneficiaries
 end

 def new
   @beneficiary = Beneficiary.new
 end

 def create
   account_no = params[:beneficiary].values[1]
   account = Account.find_by_account_no(account_no)


   if account && account.user.verify
     Beneficiary.create!(beneficiary_params)
     UserMailer.beneficiary_added(current_user).deliver
     current_user.beneficiaries << Beneficiary.last
     redirect_to  beneficiaries_path
   else
     redirect_to new_beneficiary_path
     flash[:notice] = "give  valid account number"
   end
 end

 private

 def beneficiary_params
   params.require(:beneficiary).permit(:name, :account_no).merge({user_id: current_user.id})
 end

end
