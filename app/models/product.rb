class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many :reviews

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

end

# create_table "products", force: :cascade do |t|
#     t.string   "name"
#     t.text     "description"
#     t.string   "image"
#     t.integer  "price_cents"
#     t.integer  "quantity"
#     t.datetime "created_at",  null: false
#     t.datetime "updated_at",  null: false
#     t.integer  "category_id"
#   end

#   add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree