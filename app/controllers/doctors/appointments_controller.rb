module Doctors
  class AppointmentsController < ApplicationController
    before_action :authenticate_doctor!

    def initialize(appointment, params)
      @appointment = appointment
      @params = params
    end

    def call
      if @appointment.update(@params.merge(status: :closed))
        { success: true }
      else
        { success: false, message: @appointment.errors.full_messages.to_sentence }
      end
    end

    private

    def appointment_params
      params.require(:appointment).permit(:recommendation, :status)
    end
  end
end
