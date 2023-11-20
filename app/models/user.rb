class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true
  validates :time_zone, presence: true

  has_many :notifications
  has_one :dom

  def unviewed_notifications_count
    self.notifications.unviewed.count
  end
end
