class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :firstName
      t.string :lastName
      t.references :address, index: true
      t.string :email
      t.string :phone
      t.string :description

      t.timestamps
    end
  end
end
