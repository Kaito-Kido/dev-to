class AddStatusToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :statsus, :integer
  end
end
