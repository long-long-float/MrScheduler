class NotificationsController < ApplicationController
  def index
    current_user.notifications.each do |n|
      n.is_read = true
      n.save
    end
  end

  def notify_all
    now = DateTime.now
    Group.all.each do |group|
      group.tasks.each do |task|
        if now.between?(task.deadline.yesterday, task.deadline) and !task.is_notified
          group.users.each do |user|
            user.notify "期限が近づいています #{task.title} #{task.deadline.strftime('%d日 %H時%M分')}"
          end
          task.update_attributes(is_notified: true)
        end
      end
      group.timetable.class_changes.each do |cc|
        if now.between?(cc.date1.yesterday, cc.date1) and !cc.is_notified
          group.users.each do |user|
            user.notify "授業変更です #{cc.index1}と#{cc.index2}"
          end
          cc.update_attributes(is_notified: true)
        end
      end
    end

    render nothing: true
  end
end