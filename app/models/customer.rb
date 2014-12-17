class Customer < ActiveRecord::Base
  belongs_to :address
  has_many :customerReservations
  has_many :reservations, through: :customerReservations
end
