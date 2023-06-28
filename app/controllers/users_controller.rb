class UsersController < ApplicationController
  
  def index
   @users = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    if @user.update(user_params)
        flash[:notice] = "アカウント情報を変更しました"
        redirect_to root_path
    else
        flash.now[:danger] = "アカウント情報を更新できませんでした"
        render :edit
    end
end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
   end

end
     