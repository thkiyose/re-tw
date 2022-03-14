ActiveRecord::Schema[7.0].define(version: 2022_03_14_023008) do
  enable_extension "plpgsql"

  create_table "posts", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
