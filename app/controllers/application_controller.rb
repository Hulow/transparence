class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit

  after_action :verify_authorized, except: :index, unless: :skip_pundit?, raise: false
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?, raise: false

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :first_name, :last_name, :is_contributer ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :first_name, :last_name, :is_contributer ])
  end
end
