class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.belongs_to :group

      t.string :name
      t.string :title

      t.timestamps
    end
  end
end
