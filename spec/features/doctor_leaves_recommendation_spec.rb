require 'rails_helper'

RSpec.feature "Doctor recommendation", type: :feature do
  let(:category) { Category.create!(name: "General") }
  let(:doctor) { Doctor.create!(phone: "+48111222333", password: "password", category: category) }
  let(:user) { User.create!(phone: "+48999888777", password: "password") }
  let!(:appointment) { Appointment.create!(user: user, doctor: doctor, status: :open) }

  scenario "Doctor fills recommendation" do
    visit new_doctor_session_path
    fill_in "Phone", with: doctor.phone
    fill_in "Password", with: "password"
    click_button "Log in"

    visit doctor_profile_path
    fill_in "Enter advice...", with: "Drink more water"
    click_button "Save & Close"

    expect(page).to have_content("Recommendation saved")
    expect(appointment.reload.status).to eq("closed")
  end
end
