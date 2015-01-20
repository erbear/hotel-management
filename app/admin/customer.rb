ActiveAdmin.register Customer do

  permit_params :firstName, :lastName, :address, :email, :phone, :description

  index do
    id_column
    column :firstName
    column :lastName
    # column @cust.firstName
    column :address
    column :email
    column :phone
    column :description
    actions
  end

    filter :firstName
    filter :lastName
    filter :address
    filter :email
    filter :phone
    filter :description

end
