class Cart < ApplicationRecord
	has_one :user
	has_many :cart_elements
	has_many :items, through: :cart_elements
end
