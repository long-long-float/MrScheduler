class CreateTimetables < ActiveRecord::Migration
  def change
    create_table :timetables do |t|
      t.belongs_to :group

      t.integer :author, null: false
      t.text :data

      t.timestamps
    end
  end
end
