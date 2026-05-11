# Clinic Management System (Ruby on Rails 8)

A production-ready clinic management application featuring a dynamic scheduling system and multi-role access control. This project demonstrates advanced Rails patterns, including Service Objects and RESTful API integration.

## 🚀 Project Status

- **GitHub:** [https://github.com/AndriiKharkhalis/clinic_management_rails](https://github.com/AndriiKharkhalis/clinic_management_rails)
- **Deployment:** In progress (coming soon)
- **Admin Access:** `admin@example.com` / `password`

## ✨ Key Features

### 👤 Patient (User)

- **Smart Booking:** Choose specific 30-minute time slots. The system automatically hides past slots and occupied times.
- **Dashboard:** Track appointment history and view doctor recommendations in real-time.
- **Phone-based Auth:** Secure login using phone number and password.

### 👨‍⚕️ Doctor

- **Appointment Management:** Real-time dashboard showing scheduled patients with precise time slots.
- **Medical Workflow:** Submit recommendations which automatically transition appointments from `Open` to `Closed`.
- **Capacity Control:** Built-in logic to limit active appointments (max 10) to prevent burnout.

### 🔑 Admin (ActiveAdmin)

- **Operational Control:** Full CRUD for Doctors, Patients, and Categories.
- **Appointment Management:** Ability to manually create and manage appointments with a custom Datetime Picker.
- **Analytics:** View doctor availability slots directly from the admin panel.

## 🏗 Advanced Architecture

- **Service Objects:** Business logic (Appointment Creation, Completion) is decoupled from controllers into dedicated services in `app/services`.
- **Dynamic Scheduling Engine:** Custom logic for generating 30-minute availability slots with overlap prevention.
- **API Layer:** RESTful JSON API for integration with mobile apps or external frontends.

## 🛠 Tech Stack

- **Backend:** Ruby on Rails 8, PostgreSQL.
- **Architecture:** Service Object Pattern, REST API.
- **Authentication:** Devise (Customized for Phone Number).
- **Admin UI:** ActiveAdmin.
- **Frontend:** Bootstrap 5 (Responsive Design).
- **Testing:** RSpec, Capybara.

## 📡 API Endpoints

The system provides a base for decoupled architecture:

- `GET /api/v1/doctors` - Returns a JSON list of all doctors with their categories.
- `GET /api/v1/doctors/:id` - Returns detailed info about a specific doctor.

## 🧪 Testing

The project maintains high reliability with **RSpec** (Model, Request, and Feature specs):

- **Model Specs:** Validation of PL phone formats.
- **Request Specs:** Integration testing for resource creation.
- **Feature Specs:** Full E2E scenarios (Doctor login -> Leave recommendation -> Status update).

To run tests:

```bash
bundle exec rspec
```

## ⚙️ Installation & Setup

1. **Clone the repository:**

   ```bash
   git clone https://github.com/AndriiKharkhalis/clinic_management_rails
   cd clinic_management_rails
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

   The application will be available at [http://localhost:3000](http://localhost:3000)
