class ReviewsController < ApplicationController
  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @appointment = appointment.new(appointment_params)
    @appointment.id = Appointment.find(params[:appointment_id])
    @review.appointment_id = @appointment.id
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
