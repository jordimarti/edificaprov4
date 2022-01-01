class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit
  
  def current_account
    if user_signed_in?
      if session[:account_id].present?
        @current_account = Account.find(session[:account_id])
      else
        affiliation = current_user.account_affiliations.find_by(role: 'user')
        @current_account = Account.find(affiliation.account_id)
      end
    else
      @current_account = 0
    end
  end
  helper_method :current_account

  def current_role
    if user_signed_in?
      affiliation = Affiliation.find_by(user_id: current_user, account_id: current_account)
      @current_role = affiliation.role
    else
      @current_role = "user"
    end
  end
  helper_method :current_role

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :locale, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :locale, :role])
  end
end
