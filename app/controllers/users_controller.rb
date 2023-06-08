class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.all.sample
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
    @user = User.find_by(id: params["id"])
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(user)
    else
      render status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find_by(id: params["id"])
    @user.destroy
    redirect_to "/pages/index"
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :bio, :address, :age, :photo)
  end
end
