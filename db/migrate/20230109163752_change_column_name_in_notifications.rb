class ChangeColumnNameInNotifications < ActiveRecord::Migration[6.1]
  def change
    rename_column :notifications, :status, :seen
  end
end
