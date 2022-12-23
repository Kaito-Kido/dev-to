class AddReactsCountToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :reacts_count, :integer
  end
end
