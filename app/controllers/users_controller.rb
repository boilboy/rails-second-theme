class UsersController < ApplicationController
  
  def index
   @users = User.find(params[:id])
  end

  def create
   @user = User.new(user_params)
   if @user.save
      redirect_to users_path
    else
     render new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    if @user.update(user_params)
        flash[:notice] = "アカウント情報を変更しました。"
        redirect_to root_path
    else
        render user_path
    end
end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
   end

end
     