class UsersController < ApplicationController
  def edit
  end

  def show
    @user = User.find(params[:id])
    @books = @user.post_images.page(params[:page])
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
