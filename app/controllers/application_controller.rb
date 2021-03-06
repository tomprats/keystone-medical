class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger

  def app
    @app ||= App.default
  end
  helper_method :app

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id])
  end
  helper_method :current_user

  def pages
    @active_pages ||= Page.active
  end
  helper_method :pages

  def require_user!
    not_found unless current_user
  end

  def require_admin!
    redirect_to root_path unless current_user.admin
  end

  def not_found
    raise ActionController::RoutingError.new("Not Found")
  end
end
