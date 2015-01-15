class CreateCheckinMalfunctions < ActiveRecord::Migration
  def change
    create_table :checkin_malfunctions do |t|

      t.timestamps
    end
  end
end
