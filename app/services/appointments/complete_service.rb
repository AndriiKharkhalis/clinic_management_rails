module Appointments
  class CompleteService
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
  end
end
