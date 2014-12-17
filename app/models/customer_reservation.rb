class CustomerReservation < ActiveRecord::Base
  belongs_to :reservation
  belongs_to :customer
end
