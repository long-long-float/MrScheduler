class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.belongs_to :timetable

      t.string :name
      t.string :color

      t.timestamps
    end
  end
end
