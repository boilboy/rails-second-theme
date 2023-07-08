class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
   @rooms = current_user.rooms # ログイン中ユーザーが登録した施設だけが見れるようになる
  end

  def new
   @room = Room.new
  end

  def create
   @room = Room.new(room_params)   
   if @room.save
    flash[:notice] = "施設の新規登録を完了しました。"
    redirect_to @room
   else
    render new_room_path
   end

  end

  def show
   @room = Room.find(params[:id])
   @reservation = Reservation.new(params[:room_id])
  end

  def edit
   @room = Room.find(params[:id])
  end

  def update 
   @room = Room.find(params[:id])
   if @room.update(room_params)
    flash[:notice] = "施設情報が更新されました。"
    redirect_to @room
   else
    render template: 'rooms/edit'
   end

  end

  def destroy
   @room = Room.find(params[:id])
   @room.destroy
    flash[:notice] = "施設情報が削除されました。"
    redirect_to  rooms_path
  end

  private

  def room_params
   params.require(:room).permit(:name, :room_introduction, :price, :address, :image ).merge(user_id: current_user.id)  
  end

end
