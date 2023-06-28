class ProfilesController < ApplicationController
    before_action :set_user,only: %i[ show edit update]

    def show
     @user = User.find(current_user.id)
    end

    def edit
     @user = User.find(current_user.id)
    end

    def update
      if @user.update(user_params)
        flash[:notice] = "プロフィール情報を更新しました"
        redirect_to profile_path
      else
        render "edit"
      end
    end

    private

    def set_user
     @user = User.find(current_user.id)
    end

    def user_params
     params.require(:user).permit(:image,:name,:introduction)
    end

end
