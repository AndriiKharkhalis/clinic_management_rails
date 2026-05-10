module Api
  module V1
    class DoctorsController < ActionController::API
      def index
        @doctors = Doctor.all
        render json: @doctors.as_json(
          only: [:id, :first_name, :last_name, :phone],
          include: { category: { only: :name } }
        )
      end

      def show
        @doctor = Doctor.find(params[:id])
        render json: @doctor
      end
    end
  end
end
