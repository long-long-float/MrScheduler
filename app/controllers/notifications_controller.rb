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
        if task.deadline.yesterday < now and now < task.deadline
          group.users.each do |user|
            user.notify "期限が近づいています #{task.title} #{task.deadline.strftime('%d日 %H時%M分')}"
          end
        end
      end
      group.timetable.class_changes.each do |cc|
        if cc.date1.yesterday < now and now < cc.date1
          group.users.each do |user|
            user.notify "授業変更です #{cc.index1}と#{cc.index2}"
          end
        end
      end
    end

    render nothing: true
  end
end