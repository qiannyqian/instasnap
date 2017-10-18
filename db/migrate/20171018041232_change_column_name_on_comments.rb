class ChangeColumnNameOnComments < ActiveRecord::Migration[5.1]
  def change
    rename_column :comments, :users_id, :user_id
    rename_column :comments, :photos_id, :photo_id
  end
end
