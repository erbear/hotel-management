ActiveAdmin.register Address do
  menu :priority => 2
  config.per_page = 10
permit_params :city, :street, :buildingNumber, :flatNumber

  index do
    id_column
    column :city
    column :street
    # column @cust.city
    column :buildingNumber
    column :flatNumber
    actions
  end

    filter :city
    filter :street
    filter :address
    filter :buildingNumber
    filter :flatNumber


end
