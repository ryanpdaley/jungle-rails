class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def new_order(order_id)
    @order = Order.find(order_id)

    # mail to: @order.email
    mail to: 'rpdaley@gmail.com'
  end
end
