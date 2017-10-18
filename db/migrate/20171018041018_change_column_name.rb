class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :likes, :users_id, :user_id
    rename_column :likes, :photos_id, :photo_id
  end
end
