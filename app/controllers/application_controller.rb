class ApplicationController < ActionController::Base
  around_action :switch_time_zone, :if => :current_user
  before_action :current_dom

  # Handle errors
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  def after_sign_in_path_for(resource)
    resource.dom ?  doms_path(resource.dom) : new_doms_path
  end

  def current_dom
    @current_dom ||= current_user&.dom
  end

  def switch_time_zone(&block)
    Time.use_zone(current_user.time_zone, &block)
  end
end
