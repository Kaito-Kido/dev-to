class RemovePostIdFromReacts < ActiveRecord::Migration[6.1]
  def change
    remove_column :reacts, :post_id, :integer
  end
end
