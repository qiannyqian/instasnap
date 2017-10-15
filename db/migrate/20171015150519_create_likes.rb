class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.references :users
      t.references :photos

      t.timestamps
    end
  end
end
