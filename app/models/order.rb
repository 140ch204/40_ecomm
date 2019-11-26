class Order < ApplicationRecord
	belongs_to :user
        has_many :ordered_items
       has_many :items, through: :ordered_items
       
  after_create :order_send
  after_create :admin_send
  def order_send
    OrderMailer.order_email(self).deliver_now
  end

  def admin_send
    OrderMailer.admin_email(self).deliver_now
  end
end
