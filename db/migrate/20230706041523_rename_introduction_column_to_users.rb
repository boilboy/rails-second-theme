class RenameIntroductionColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :introduction, :self_introduction
  end
end
