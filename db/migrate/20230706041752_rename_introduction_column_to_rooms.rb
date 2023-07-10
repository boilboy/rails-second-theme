class RenameIntroductionColumnToRooms < ActiveRecord::Migration[6.1]
  def change
    rename_column :rooms, :introduction, :room_introduction
  end
end
