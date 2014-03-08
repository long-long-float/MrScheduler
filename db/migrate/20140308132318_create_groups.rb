class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.text :quiz
      t.text :answer

      t.timestamps
    end
  end
end
