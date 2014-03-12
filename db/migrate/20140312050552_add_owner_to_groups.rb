class AddOwnerToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :owner, :integer, null: false, default: 0
  end
end
