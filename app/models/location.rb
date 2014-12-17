class Location < ActiveRecord::Base
  belongs_to :type
  belongs_to :level
end
