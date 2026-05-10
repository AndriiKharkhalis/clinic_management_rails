class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, authentication_keys: [:phone]
    has_many :appointments
    has_many :doctors, through: :appointments

    validates :phone, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }, if: -> { password.present? }

    def self.ransackable_associations(auth_object = nil)
    ["appointments", "doctors"]
    end

    def self.ransackable_attributes(auth_object = nil)
    ["first_name", "last_name", "phone", "id", "created_at"]
    end

    def display_name
        "#{first_name} #{last_name} (#{phone})"
    end

end
