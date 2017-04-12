class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

end

# create_table "orders", force: :cascade do |t|
#     t.integer  "total_cents"
#     t.datetime "created_at",       null: false
#     t.datetime "updated_at",       null: false
#     t.string   "stripe_charge_id"
#     t.string   "email"
#   end
