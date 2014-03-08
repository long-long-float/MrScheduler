class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :group
      t.belongs_to :user

      t.string :title
      t.text :content
      t.datetime :deadline

      t.timestamps
    end
  end
end
