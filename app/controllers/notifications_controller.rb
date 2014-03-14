class NotificationsController < ApplicationController
  def index
    current_user.notifications.each do |n|
      n.is_read = true
      n.save
    end
  end
end
