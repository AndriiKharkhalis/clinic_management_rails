module Doctors
  class AppointmentsController < ApplicationController
    before_action :authenticate_doctor!

    def update
      @appointment = current_doctor.appointments.find(params[:id])
      
      result = Appointments::CompleteService.new(@appointment, appointment_params).call

      if result[:success]
        redirect_to doctor_profile_path, notice: "Recommendation saved and appointment closed."
      else
        redirect_to doctor_profile_path, alert: "Error: #{result[:message]}"
      end
    end

    private

    def appointment_params
      params.require(:appointment).permit(:recommendation, :status)
    end
  end
end
