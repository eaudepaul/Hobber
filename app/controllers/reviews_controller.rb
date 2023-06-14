# frozen_string_literal: true

# Top-level documentation comment
class ReviewsController < ApplicationController
  def index
    # Reviews that current user received: this finds all the reviews left by a secondary_user for the current user, who is defined in a Match instance
    @reviews = Review.where(user_id: current_user.matches.pluck(:secondary_user_id))
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
    @appointment = Appointment.find(params[:appointment_id])
  end

  def create
    @review = Review.new(review_params)
    @appointment = Appointment.find(params[:appointment_id])
    @review.appointment = @appointment
    @review.user_id = current_user.id
    if @review.save!
      redirect_to appointments_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :appointment_id)
  end
end
