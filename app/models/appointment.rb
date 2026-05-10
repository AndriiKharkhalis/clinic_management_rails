class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

   enum :status, { open: 0, closed: 1 }

    validate :doctor_capacity_limit, on: :create

    private

    def doctor_capacity_limit
        if doctor.appointments.open.count >= 10
            errors.add(:doctor, "has reached the maximum number of open appointments")
        end
    end

    def self.ransackable_attributes(auth_object = nil)
      ["created_at", "doctor_id", "id", "recommendation", "status", "updated_at", "user_id", "start_time"]
    end

    def self.ransackable_associations(auth_object = nil)
      ["doctor", "user"]
    end
end
