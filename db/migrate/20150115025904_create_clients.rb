class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.integer :phone
      t.string :description

      t.timestamps
    end
  end
end
