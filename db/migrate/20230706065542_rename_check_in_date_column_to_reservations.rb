class RenameCheckInDateColumnToReservations < ActiveRecord::Migration[6.1]
  def change
    rename_column :reservations, :check_in_date, :start_at
  end
end
