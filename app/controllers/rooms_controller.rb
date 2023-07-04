class RoomsController < ApplicationController

  def index
   @rooms = Room.all # roomsテーブルの全データを取得する
  end

  def new
   @room = Room.new
  end

  def create
   @room = Room.new(room_params)   
   if @room.save
    flash[:notice] = "施設の新規登録を完了しました。"
    redirect_to controller: :rooms, action: :index
   else
    render new_room_path
   end

  end

  def edit
    @room = Room.find(params[:id])
  end

  def show
   @room = Room.find(params[:id])
  end

  def update 
   @room = Room.find(params[:id])
   if @room.update(room_params)
    flash[:notice] = "施設情報が更新されました。"
    redirect_to controller: :rooms, action: :index
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
   params.require(:room).permit(:name, :introduction, :price, :address, :image ).merge(user_id: current_user.id)  
  end

end
