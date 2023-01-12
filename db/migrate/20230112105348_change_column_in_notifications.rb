class ChangeColumnInNotifications < ActiveRecord::Migration[6.1]
  def change
    change_column :notifications, :seen, :boolean, default: false
  end
end
