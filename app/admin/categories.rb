ActiveAdmin.register Category do
  permit_params :name

  index do
    selectable_column
    id_column
    column :name
    column "Doctors Count" do |category|
      category.doctors.count
    end
    actions
  end
end
