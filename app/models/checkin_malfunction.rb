class CheckinMalfunction < ActiveRecord::Base
	belongs_to :checkin
	belongs_to :malfunction
end
