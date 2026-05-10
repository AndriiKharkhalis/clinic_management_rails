ActiveAdmin.register Appointment do
  actions :all
  
  permit_params :status, :user_id, :doctor_id, :recommendation, :start_time

    form do |f|
    f.inputs "Appointment Details" do
      # Use "string" input type with datetime-local for better date-time picking in ActiveAdmin
      f.input :start_time, as: :string, 
              input_html: { 
                type: 'datetime-local', 
                step: 1800, # Step of 30 minutes
                style: 'width: auto; display: inline-block;' # Slight style adjustment
              }
      
      f.input :user
      f.input :doctor
      f.input :status, as: :select, collection: Appointment.statuses.keys
      
      if f.object.closed?
        f.input :recommendation, input_html: { disabled: true }, 
                hint: "This advice was left by a doctor and cannot be edited by admin."
      else
        f.input :recommendation
      end
    end
    f.actions
  end


  index do
    selectable_column
    id_column
    column :user
    column :doctor
    column "Appointment Time", sortable: :start_time do |appointment|
      appointment.start_time&.strftime("%B %d, %Y at %H:%M")
    end
    column :status
    column :created_at
    actions
  end
end
