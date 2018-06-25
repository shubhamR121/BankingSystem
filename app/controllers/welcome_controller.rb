class WelcomeController < ApplicationController
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id]) 
  end 

  def verified
    @user = User.find(params[:id])
    @user.update_columns(verify: true)
    @user = User.all

    respond_to do |format|
     format.html do
      redirect_to welcomes_path 
     end 
     format.js
    end
  end
end
