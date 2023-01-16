class RemovePostRefOfNotifications < ActiveRecord::Migration[6.1]
  def change
    remove_reference :notifications, :post, index: true, foreign_key: true
  end
end
