class AddPostRefToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_reference :notifications, :post, null: false, foreign_key: true
  end
end
