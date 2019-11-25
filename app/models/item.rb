class Item < ApplicationRecord
  has_many :ordered_items
  has_many :orders, through: :ordered_items

  validates :title,
    presence: true,
    uniqueness: true

  validates :image_url,
    presence: true,
    uniqueness: true,
    format: { with: /\A[h]t{2}[p]s?[:]\/{2}(\S+)[.](\D{2,3}\z)/ }

  validates :description,
    presence: true

  validates :price,
    presence: true,
    numericality: true
end
