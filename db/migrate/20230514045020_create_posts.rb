class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.integer :user_id,      null: false, default: ""
      t.integer :genre_id,     null: false, default: ""
      t.string  :name,         null: false, default: ""
      t.text    :introduction, null: false, default: ""
      t.string  :cost,         null: false, default: ""

      t.timestamps
    end
  end
end
