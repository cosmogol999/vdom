class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.notifications
    @notifications.update(viewed: true)
  end

  def destroy
    Notification.find(params[:id]).destroy
    
    redirect_to notifications_path
  end
end