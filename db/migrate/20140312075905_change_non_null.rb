class ChangeNonNull < ActiveRecord::Migration
  def change
    change_column :comments, :user_id, :integer, null: false
    change_column :comments, :task_id, :integer, null: false

    change_column :groups, :name, :string, null: false
    
    change_column :tasks, :group_id, :integer, null: false
    change_column :tasks, :user_id, :integer, null: false

    change_column :user_and_groups, :user_id, :integer, null: false
    change_column :user_and_groups, :group_id, :integer, null: false
    
    change_column :users, :name, :string, null: false
  end
end
