class Customer < ActiveRecord::Base
  belongs_to :address
  has_many :customerReservations
  has_many :reservations, through: :customerReservations
  # has_many :orders, through: :customerOrders
end
