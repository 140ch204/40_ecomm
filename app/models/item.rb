class Item < ApplicationRecord
  has_many :ordered_items
  has_many :orders, through: :ordered_items
  has_many :cart_elements
  has_many :carts, through: :cart_elements

  validates :title,
    presence: true,
    uniqueness: true

  validates :image_url,
    presence: true,
    uniqueness: true,
    format: { with: /\A[h]t{2}[p]s?[:]\/{2}(\S+)[.](\D{2,3})\/\S*/ }

  validates :description,
    presence: true

  validates :price,
    presence: true,
    numericality: true
end
