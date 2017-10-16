class AddLikeToLikes < ActiveRecord::Migration[5.1]
  def change
    add_column :likes, :likes, :integer
  end
end
