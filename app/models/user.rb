class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
        has_many :orders
	has_many :ordered_items, through: :orders
	# has_many :items, through: :cart
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
