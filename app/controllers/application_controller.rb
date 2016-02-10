class ApplicationController < ActionController::Base
  layout 'dashboard'

  protect_from_forgery with: :null_session

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    admin_dashboard_index_url
  end

  def after_sign_out_path_for(resource)
    root_url
  end


  protected

  def paginate(query)
    query.page(params[:page]).per(10)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :password, :email, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username,:password, :email, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end

  def create_slug(obj, field)
    obj.slug = field.to_slug.normalize.to_s
  end

end
