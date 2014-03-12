class CreateUserAndGroups < ActiveRecord::Migration
  def change
    create_table :user_and_groups do |t|
      t.belongs_to :user
      t.belongs_to :group

      t.timestamps
    end
    remove_column :users, :group_id
  end
end
