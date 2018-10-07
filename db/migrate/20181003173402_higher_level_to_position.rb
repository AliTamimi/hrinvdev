class HigherLevelToPosition < ActiveRecord::Migration[5.2]
  def change
    add_column :positions, :higher_level, :boolean, default: false
  end
end
