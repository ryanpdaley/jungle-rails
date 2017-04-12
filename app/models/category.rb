class Category < ActiveRecord::Base

  has_many :products

end

# create_table "categories", force: :cascade do |t|
#     t.string   "name"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end