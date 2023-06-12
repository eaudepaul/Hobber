class UsersController < ApplicationController
  before_action :set_user, only: %i[destroy edit update]

  def index
    @users = User.all
  end

  def show
    @user = current_user.id
    @chatroom = Chatroom.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      redirect_to user_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to games_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to "/pages/index"
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :bio, :address, :age, :photo)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
