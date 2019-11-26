class OrderMailer < ApplicationMailer

  def order_email(order)
    @order = order
    @user = User.find(order.user_id)
    @items = []

    # Renvoi un array contenant les produits achetés
    @user.cart.cart_elements.each do |item|
      @items << Item.find(item.item_id)
    end

    mail(from: 'jeanmichelthp@gmail.com', to: @user.email, subject: "Thanks for your purchase !")
  end 

  def admin_email(order)
    @admins = User.where(admin: true)
    @order = order
    @user = User.find(order.user_id)
    @items = []
    # Renvoi un array contenant les produits achetés
    @user.cart.cart_elements.each do |item|
      @items << Item.find(item.item_id)
    end
    @admins.each do |admin|
      mail(from: 'jeanmichelthp@gmail.com', to: admin.email, subject: "New order")
    end
  end
end
