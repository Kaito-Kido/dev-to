class ChangeNullToTrueInNotifications < ActiveRecord::Migration[6.1]
  def change
    change_column :notifications, :post_id, :integer, null: true
  end
end
