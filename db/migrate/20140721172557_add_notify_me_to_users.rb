class AddNotifyMeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :notify_me, :boolean, null: false, default: false
  end
end
