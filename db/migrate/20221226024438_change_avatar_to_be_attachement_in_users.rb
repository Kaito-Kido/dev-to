class ChangeAvatarToBeAttachementInUsers < ActiveRecord::Migration[6.1]
  def up
    change_column :users, :avatar, :attachment
  end
  
  def down
    change_column :users, :avatar, :text
  end
end
