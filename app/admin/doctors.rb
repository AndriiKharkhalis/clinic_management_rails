ActiveAdmin.register Doctor do
  permit_params :phone, :first_name, :last_name, :category_id, :password, :password_confirmation

  filter :category
  filter :phone
  filter :first_name
  filter :last_name
  filter :created_at

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :phone
    column :category
    actions
  end

  form do |f|
    f.inputs "Doctor Details" do
      f.input :category, as: :select, collection: Category.all
      f.input :first_name
      f.input :last_name
      f.input :phone
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
