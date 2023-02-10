class ChangeRoleToBeIntegerInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :role, :integer, using: 'role::integer'
  end
end
