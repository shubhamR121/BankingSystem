class ApplicationController < ActionController::Base

 #before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:password,:father_name,:mother_name,:occupation,:fathers_occupation,:mothers_occupation,:phone_number,:social_security_number,:PAN,:document,:profile_photo,permanent_address_attributes: [:house_number,:street_number,:area,:city,:state,:country,:pin,:address_proof]])
  end

end
