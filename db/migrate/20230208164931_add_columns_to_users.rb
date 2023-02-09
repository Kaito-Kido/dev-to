class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :bio, :string
    add_column :users, :location, :string
    add_column :users, :work, :string
    add_column :users, :education, :string
  end
end
