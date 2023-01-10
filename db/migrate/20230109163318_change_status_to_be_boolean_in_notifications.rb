class ChangeStatusToBeBooleanInNotifications < ActiveRecord::Migration[6.1]
  def change
    change_column :notifications, :status, :boolean
  end
end
