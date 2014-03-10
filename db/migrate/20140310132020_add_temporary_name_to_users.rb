class AddTemporaryNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :temporary_name, :string
  end
end
