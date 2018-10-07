class AddBlockAccessToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :block_access, :boolean, default: false
  end
end
