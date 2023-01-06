class AddPostRefToReacts < ActiveRecord::Migration[6.1]
  def change
    add_reference :reacts, :post, null: false, foreign_key: true
  end
end
