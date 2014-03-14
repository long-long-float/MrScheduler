class CreateClassChanges < ActiveRecord::Migration
  def change
    create_table :class_changes do |t|
      t.belongs_to :timetable

      t.date :date1
      t.integer :index1
      t.date :date2
      t.integer :index2

      t.timestamps
    end
  end
end
