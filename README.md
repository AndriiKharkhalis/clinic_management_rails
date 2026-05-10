# Clinic Management System (Ruby on Rails)

A comprehensive clinic management application with three user roles: **Patient**, **Doctor**, and **Admin**. Built as a test project to demonstrate proficiency in Ruby on Rails, authentication, authorization, and automated testing.

## Live Demo

- **URL:** [Link to your deployed app, e.g., on Render/Fly.io]
- **Admin Access:** `admin@example.com` / `password`

## Features

### Patient (User)

- **Authentication:** Sign up and log in using **Phone Number** and Password (via Devise).
- **Profile:** Personal dashboard to view appointment history and doctor recommendations.
- **Booking:** Browse doctors by categories and book appointments.
- **Recommendations:** Receive medical advice from doctors after the appointment is closed.

### Doctor

- **Profile:** View a list of patients who have booked an appointment.
- **Workflow:** Leave a recommendation for a patient.
- **Auto-Close:** Appointments automatically transition from `Open` to `Closed` status once a recommendation is submitted.
- **Workload Limit:** A doctor can have a maximum of **10 open appointments** at a time.

### Admin

- **Dashboard:** Full access to patients and doctors list via **ActiveAdmin**.
- **Management:** Create, edit, and delete medical categories and doctor profiles.
- **Assignment:** Assign doctors to specific medical categories (e.g., Cardiologist, Therapist).

## Tech Stack

- **Framework:** Ruby on Rails 8.x
- **Database:** PostgreSQL
- **Authentication:** Devise (Customized for Phone Number login)
- **Authorization:** CanCanCan
- **Admin Interface:** ActiveAdmin
- **Frontend:** Bootstrap 5
- **Storage:** Cloudinary / AWS S3 integration for images.

## Testing

The project is covered with **RSpec** tests (Model, Request, and Feature specs):

- **Model:** Validates doctor's phone number format (Polish/UA format support).
- **Request:** Verifies the successful creation of resources (e.g., Categories).
- **Feature:** Simulates a full user journey: Doctor login -> Dashboard -> Leaving a recommendation -> Status update.

To run tests:

```bash
bundle exec rspec
```

## ⚙️ Installation & Setup

1. **Clone the repository:**

   ```bash
   git clone https://github.com
   cd clinic_management
   ```

2. **Install dependencies:**

   ```bash
   bundle install
   ```

3. **Database setup:**

   ```bash
   bin/rails db:create
   bin/rails db:migrate
   bin/rails db:seed
   ```

4. **Run the server:**
   ```bash
   bin/rails s
   ```
