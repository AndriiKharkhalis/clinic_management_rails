class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @appointments = current_user.appointments.includes(:doctor).order(created_at: :desc)
  end
end
