class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :users
      t.references :photos

      t.timestamps
    end
  end
end
