class Customer < ActiveRecord::Base
  belongs_to :address
  has_many :customerReservations
  has_many :reservations, through: :customerReservations
  accepts_nested_attributes_for :address
  # has_many :orders, through: :customerOrders
end
