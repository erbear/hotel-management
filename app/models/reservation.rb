class Reservation < ActiveRecord::Base
  belongs_to :location
  has_one :checkin
  has_many :customerReservations
  has_many :customers, through: :customerReservations
end
