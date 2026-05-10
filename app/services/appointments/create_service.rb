module Appointments
  class CreateService
    def initialize(user, doctor, start_time)
      @user = user
      @doctor = doctor
      @start_time = start_time.to_datetime
      @end_time = @start_time + 30.minutes
    end

    def call
      return { success: false, message: "This time slot is already taken" } unless slot_available?
      return { success: false, message: "Doctor has reached the limit of 10 open records" } unless doctor_capacity_ok?

      appointment = @user.appointments.build(
        doctor: @doctor, 
        start_time: @start_time, 
        end_time: @end_time, 
        status: :open
      )

      if appointment.save
        { success: true, appointment: appointment }
      else
        { success: false, message: appointment.errors.full_messages.to_sentence }
      end
    end

    private

    def slot_available?
      !@doctor.appointments.where(status: :open)
              .where("start_time < ? AND end_time > ?", @end_time, @start_time)
              .exists?
    end

    def doctor_capacity_ok?
      @doctor.appointments.where(status: :open).count < 10
    end
  end
end
