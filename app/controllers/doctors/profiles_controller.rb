module Doctors
  class ProfilesController < ApplicationController
    before_action :authenticate_doctor!

    def show
      @doctor = current_doctor
      @appointments = @doctor.appointments.includes(:user).order(created_at: :desc)
    end
  end
end
