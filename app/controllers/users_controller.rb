class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
  end
  def show
    # before_action
  end
  def new
    @user = User.new
  end
  def create
    if @user.save(user_params)
      # render show page
      redirect_to user_path(@user)
    else
      render :new
    end
  end
  def edit
    # before_action
  end
  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
  def destroy
    @user.destroy
    redirect_to users_path
  end
  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
