class Reservation < ActiveRecord::Base
  belongs_to :location
  has_one :checkin
end
