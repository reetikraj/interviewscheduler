class ChangeConnectionsToInt < ActiveRecord::Migration[5.1]
  def change
  	rename_table :connections, :interviews_users
  end
end
