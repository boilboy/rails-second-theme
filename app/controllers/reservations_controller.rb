class ReservationsController < ApplicationController

  def index
   @reservations = current_user.reservations
  end
  
  def create
   @reservation = Reservation.new(reservation_params)
   if @reservation.save
    flash[:notice] = "施設の予約が完了しました。"
    redirect_to reservations_path
   else 
    render controller: :rooms, action: :show
   end

  end

  def destroy
   @reservation = Reservation.find(params[:id])
   @reservation.destroy
    flash[:notice] = "予約情報を削除しました。"
    redirect_to reservations_path
  end

  def confirm
   @room = Room.find(params[:room_id])
   @reservation = Reservation.new(params.permit(:start_at, :end_at, :number_of_people, :stay_days, :room_id, :user_id))
   @stay_days = (@reservation.end_at - @reservation.start_at)

   if @stay_days < 1 && @reservation.number_of_people == nil 
    flash[:notice] = "人数を入力してください。チェックアウト日はチェックイン日より前の日付では登録できません。"
    redirect_to @room
   elsif @stay_days < 1 
    flash[:notice] = "チェックアウト日はチェックイン日より前の日付では登録できません。"
    redirect_to @room
   elsif @reservation.number_of_people == nil 
    flash[:notice] = "人数を入力してください。"
    redirect_to @room
   else
    @total_amount_price = @stay_days * @room.price * @reservation.number_of_people
   end

  end

  private

  def reservation_params
   params.require(:reservation).permit(:start_at, :end_at, :stay_days, :number_of_people, :total_amount_price, :room_id).merge(user_id: current_user.id)  
  end

end
