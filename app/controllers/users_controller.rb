class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params["id"])
  end

  def new
    @user = User.new
  end

  def create
    user = User.new
    user.name = params["name"]
    user.email = params["email"]
    user.username = params["username"]
    user.bio = params["bio"]
    user.address = params["address"]
    user.age = params["age"]
    user.save
    redirect_to "/users/#{user.id}"
  end
end
