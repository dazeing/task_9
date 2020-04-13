class RenameLogsTypeToUserType < ActiveRecord::Migration[6.0]
  def change
    rename_column :logs, :type, :user_type
  end
end
