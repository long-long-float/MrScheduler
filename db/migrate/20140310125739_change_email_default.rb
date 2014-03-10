class ChangeEmailDefault < ActiveRecord::Migration
  def change
    change_column :users, :email, :string, null: true
    change_column_default :users, :email, nil

    change_column :users, :encrypted_password, :string, null: true
    change_column_default :users, :encrypted_password, nil
  end
end
