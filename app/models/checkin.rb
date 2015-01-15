class Checkin < ActiveRecord::Base
  belongs_to :reservation
  has_many :malfunctions, through: :checkin_malfunctions
end
