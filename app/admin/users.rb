ActiveAdmin.register User do
  permit_params :phone, :first_name, :last_name

  filter :phone
  filter :first_name
  filter :last_name
  filter :created_at

  index do
    selectable_column
    id_column
    column :phone
    column :first_name
    column :last_name
    column :created_at
    actions
  end
end
