class RenameNameColumnToRooms < ActiveRecord::Migration[6.1]
  def change
    rename_column :rooms, :name, :room_name
  end
end
