class CartElement < ApplicationRecord
	belongs_to :cart
	has_many :items
end
