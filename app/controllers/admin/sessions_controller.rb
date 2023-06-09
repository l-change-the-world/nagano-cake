# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  private
  def after_sign_in_path_for(resource)
    admin_path
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  #def ensure_correct_admin
  #  @admin = Admin.find(params[:id])
  #  if @admin == current_user
  #  else
  #    redirect_to new_admin_session_path
  #  end
  #end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
