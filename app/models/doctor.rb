class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, authentication_keys: [:phone]
  belongs_to :category
  has_many :appointments
  has_many :users, through: :appointments

  validates :phone, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, if: -> { password.present? }
  validates :phone, format: { with: /\A\+48\d{9}\z/, message: "must be in format +48XXXXXXXXX" }

  def self.ransackable_associations(auth_object = nil)
  ["appointments", "category", "users"]
  end

  def self.ransackable_attributes(auth_object = nil)
  ["first_name", "last_name", "phone", "id", "category_id"]
  end

  def display_name
    "#{first_name} #{last_name}"
  end

  def available_slots(date)
    work_start = date.to_datetime.change(hour: 9)
    work_end = date.to_datetime.change(hour: 17)
    
    slots = []
    current_slot = work_start

    while current_slot < work_end
      is_taken = appointments.where(status: :open)
                             .where(start_time: current_slot)
                             .exists?
      
      slots << current_slot unless is_taken
      current_slot += 30.minutes
    end
    slots
  end

  def available_slots(date)
    # 1. Define working hours
    work_start_hour = 9
    work_end_hour = 17
    
    # If the selected date is today, and it's already past 5:00 PM,
    # or if we want to automatically show tomorrow — logic below:
    target_date = date.to_date
    now = Time.current

    # If it's later than the end of the work day today — switch to tomorrow
    if target_date == now.to_date && now.hour >= work_end_hour
      target_date = target_date + 1.day
    end

    # Set the boundaries of the work day for the selected date
    start_time = target_date.to_datetime.change(hour: work_start_hour)
    end_time = target_date.to_datetime.change(hour: work_end_hour)
    
    slots = []
    current_slot = start_time

    while current_slot < end_time
      # CONDITION 1: The slot must be in the future (if it's today)
      # CONDITION 2: The slot must not be taken in the database
      is_in_past = current_slot < (now + 5.minutes) # add 5 min buffer
      is_taken = appointments.where(status: :open)
                             .where(start_time: current_slot)
                             .exists?
      
      slots << current_slot unless is_in_past || is_taken
      current_slot += 30.minutes
    end
    slots
  end

end
