class AddTotalAmountPriceToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :total_amount_price, :integer
  end
end
