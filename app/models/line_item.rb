class LineItem < ActiveRecord::Base

  belongs_to :order
  belongs_to :product

  monetize :item_price_cents, numericality: true
  monetize :total_price_cents, numericality: true

end

# create_table "line_items", force: :cascade do |t|
#     t.integer  "order_id"
#     t.integer  "product_id"
#     t.integer  "quantity"
#     t.integer  "item_price_cents"
#     t.integer  "total_price_cents"
#     t.datetime "created_at",        null: false
#     t.datetime "updated_at",        null: false
#   end

#   add_index "line_items", ["order_id"], name: "index_line_items_on_order_id", using: :btree
#   add_index "line_items", ["product_id"], name: "index_line_items_on_product_id", using: :btree
