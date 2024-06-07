class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.all
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page])
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
