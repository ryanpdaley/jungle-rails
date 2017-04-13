class UserMailerPreview < ActionMailer::Preview

  def new_order
    order_id = 2
    UserMailer.new_order(order_id)
  end

end