class User < ApplicationRecord
  after_create :cart_create
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :cart
  has_many :orders
	has_many :ordered_items, through: :orders
	# has_many :items, through: :cart
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def cart_create
    Cart.create(user_id: self.id)
  end
end
