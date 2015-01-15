class CreateMalfunctions < ActiveRecord::Migration
  def change
    create_table :malfunctions do |t|
      t.string :description

      t.timestamps
    end
  end
end
