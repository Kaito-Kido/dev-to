class AddReactsCountToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :reacts_count, :integer
  end
end
