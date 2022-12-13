class ChangeRoleToBeIntegerInUsers < ActiveRecord::Migration[6.1]
  def up
    change_column :users, :role, :integer
  end
end
