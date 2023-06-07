class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = appointment.new(appointment_params)
    @user_match.id = User_match.find(params[:user_match_id])
    @appointment.user_match.id = @user_match.id
    if @appointment.save!
      redirect_to appointments_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path, notice: 'appointment successfully deleted.'
  end

  private

  def appointment_params
    params.require(:appointment).permit(:address, :date, :start_time, :end_time, :game, :user_match)
  end
end