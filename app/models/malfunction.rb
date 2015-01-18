class Malfunction < ActiveRecord::Base
	has_many :checkin, through: :checkin_malfunction
end