require 'rails_helper'

RSpec.feature "Doctor recommendation", type: :feature do
  let!(:category)    { Category.create!(name: "General") }
  let!(:doctor)      { Doctor.create!(phone: "+48111222333", password: "password", category: category) }
  let!(:user)        { User.create!(phone: "+48999888777", password: "password") }
  let!(:appointment) { Appointment.create!(user: user, doctor: doctor, status: :open) }

  scenario "Doctor logs in and successfully saves a recommendation" do
    visit new_doctor_session_path
    fill_in "Phone", with: doctor.phone
    fill_in "Password", with: "password"
    click_button "Log in"

    expect(page).to have_current_path(doctor_profile_path)
    expect(page).to have_content("Doctor's Dashboard")

    within "tr", text: user.phone do
      fill_in "appointment[recommendation]", with: "Drink more water and rest"
      click_button "Save & Close"
    end

    expect(page).to have_content("Recommendation saved and appointment closed.")

    appointment.reload
    expect(appointment.recommendation).to eq("Drink more water and rest")
    expect(appointment.status).to eq("closed")

    expect(page).to have_content("Drink more water and rest")
    expect(page).not_to have_button("Save & Close")
  end
end
