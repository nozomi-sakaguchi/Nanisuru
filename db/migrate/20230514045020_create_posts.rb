class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.integer :user_id,      null: false
      t.integer :genre_id,     null: false
      t.string  :name,         null: false
      t.text    :introduction, null: false
      t.string  :cost,         null: false

      t.timestamps
    end
  end
end
