class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def new_order(order_id)
    @order = Order.find(order_id)
    @mail_subject = "Jungle Order Confirmation ##{@order.id}"
    mail(to: @order.email, subject: @mail_subject)
  end
end
