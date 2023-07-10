class RenameCheckOutDateColumnToReservations < ActiveRecord::Migration[6.1]
  def change
    rename_column :reservations, :check_out_date, :end_at
  end
end
