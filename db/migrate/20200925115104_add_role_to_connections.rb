class AddRoleToConnections < ActiveRecord::Migration[5.1]
  def change
    add_column :connections, :role, :integer
  end
end
