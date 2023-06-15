# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[destroy edit update show]

  def index
    @users = User.all
  end

  def show
    @chatroom = Chatroom.new
    reviews = @user.appointments.map { |appointment| appointment.reviews.where.not(user: @user) }.flatten
    sum = 0
    if reviews.empty?
      @average_rating = 'none'
    else
      reviews.each do |review|
        sum += review.rating
      end
      @average_rating = (sum.to_f / reviews.length).round
    end
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

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to games_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to '/pages/index'
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :bio, :address, :age, :photo)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
