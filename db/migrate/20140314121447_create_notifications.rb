class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.belongs_to :user

      t.text :content
      t.boolean :is_read, default: false

      t.timestamps
    end
  end
end
