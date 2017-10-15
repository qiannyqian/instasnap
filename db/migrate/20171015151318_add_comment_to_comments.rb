class AddCommentToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :comment, :string
  end
end
