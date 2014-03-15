class AddIsNotifiedToTaskAndClassChange < ActiveRecord::Migration
  def change
    add_column :tasks, :is_notified, :boolean, default: false
    add_column :class_changes, :is_notified, :boolean, default: false
  end
end
