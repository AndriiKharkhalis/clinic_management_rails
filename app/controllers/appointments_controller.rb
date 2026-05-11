class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @doctor = Doctor.find(params[:doctor_id])
  
    start_time = params[:start_time]

    result = Appointments::CreateService.new(current_user, @doctor, start_time).call

    if result[:success]
      redirect_to profile_path, notice: "Successfully booked for #{start_time.to_datetime.strftime('%H:%M')}!"
    else
      redirect_back fallback_location: root_path, alert: result[:message]
    end
  end
end
