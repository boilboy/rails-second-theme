class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :search]
  
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

  def search
   if params[:address].present?
    @rooms = Room.where(["address LIKE(?)", "%#{params[:address]}%"])
   elsif params[:keyword].present? 
    @rooms = Room.where(["room_name LIKE(?) OR room_introduction LIKE(?)", "%#{params[:keyword]}%", "%#{params[:keyword]}%"])
   else
    @rooms = Room.all
   end
  end

  private

  def room_params
   params.require(:room).permit(:room_name, :room_introduction, :price, :address, :image, :room_id ).merge(user_id: current_user.id)  
  end

end
