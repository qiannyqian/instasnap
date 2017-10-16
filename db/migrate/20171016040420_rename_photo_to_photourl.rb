class RenamePhotoToPhotourl < ActiveRecord::Migration[5.1]
  def change
    rename_column :photos, :photo, :photo_url
  end
end
