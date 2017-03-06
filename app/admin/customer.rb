ActiveAdmin.register Customer do
  menu :priority => 1
  config.per_page = 10
  permit_params :firstName, :lastName, :address, :email, :phone, :description

  index do
    id_column
    column :firstName
    column :lastName
    # column @cust.firstName
    # column :address
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

  form do |f|
    f.inputs "Customer details" do
      f.input :firstName
      f.input :lastName
      f.input :email
      f.input :phone
      # f.input custAll[:lastName]

      f.inputs do
        f.has_many :address, heading: 'Customer address', allow_destroy: false, new_record: false do |a|
          a.input :city
          a.input :street
          a.input :buildingNumber
          a.input :flatNumber
        end
      end
      f.input :description
    end

    f.actions
  end

  action_item :view_site do

  end

end
