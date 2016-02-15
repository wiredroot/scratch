class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :profiles, :comments, :bio
  end
end
