module Notificable
  extend ActiveSupport::Concern

  included do
    has_many :notifications, as: :item, dependent: :destroy
    after_create_commit :send_notifications_to_users
  end

  def send_notifications_to_users
    if self.respond_to? :dom_id
      Notification.create! user_id: Dom.find(self.dom_id)&.user_id, item: self
    end
  end
end