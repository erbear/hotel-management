class Order < ActiveRecord::Base
	has_many :dishes
	has_many :customer, through: :customer_order
end
