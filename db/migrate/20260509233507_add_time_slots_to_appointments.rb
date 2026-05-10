class AddTimeSlotsToAppointments < ActiveRecord::Migration[8.1]
  def change
    add_column :appointments, :start_time, :datetime
    add_column :appointments, :end_time, :datetime
  end
end
