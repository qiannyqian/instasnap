class AddBoostToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :boost, :boolean
  end
end
