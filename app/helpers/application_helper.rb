module ApplicationHelper
  def get_order_items(order_id)
    all_line_items = []
    order = Order.find(order_id)
    LineItem.where(order_id: order_id).find_each do |line_item|
      all_line_items << line_item
    end
    all_line_items
  end
end
