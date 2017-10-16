class ChangeUsersIdInPhotos < ActiveRecord::Migration[5.1]
  def change
    rename_column :photos, :users_id, :user_id
  end
end
