class ChangeColumnNameInCategories < ActiveRecord::Migration[6.1]
  def change
    rename_column :categories, :tag, :name
  end
end
