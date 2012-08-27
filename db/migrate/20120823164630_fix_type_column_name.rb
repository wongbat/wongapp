class FixTypeColumnName < ActiveRecord::Migration

  def change
    rename_column :campaigns, :type, :style
  end
end
    