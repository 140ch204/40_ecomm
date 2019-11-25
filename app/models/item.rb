class Item < ApplicationRecord
  validates :title,
    presence: true,
    uniqueness: true

  validates :image_url,
    presence: true,
    uniqueness: true,
    format: { with: /https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)/ }

  validates :description,
    presence: true

  validates :price,
    presence: true,
    numericality: true
end
