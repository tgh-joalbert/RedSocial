class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :set_layout

  before_action :configurar_strong_params, if: :devise_controller?

  # before_action :authenticate_user!

  protected

  def set_layout
    'application'
  end

  private

  def configurar_strong_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
