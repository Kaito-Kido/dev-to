class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :statsus, :status
  end
end
