require 'rails_helper'

RSpec.describe Doctor, type: :model do
  let(:category) { Category.create(name: "Dentist") }

  it "is valid with a correct Polish phone number" do
    doctor = Doctor.new(
      phone: "+48123456789", 
      password: "password123", 
      category: category,
      first_name: "Jan",
      last_name: "Kowalski"
    )
    expect(doctor).to be_valid
  end

  it "is invalid with a wrong phone format (e.g. too short)" do
    doctor = Doctor.new(phone: "+48123")
    expect(doctor).not_to be_valid
    expect(doctor.errors[:phone]).to include("must be in format +48XXXXXXXXX")
  end

  it "is invalid without a '+' sign" do
    doctor = Doctor.new(phone: "48123456789")
    expect(doctor).not_to be_valid
  end
end
