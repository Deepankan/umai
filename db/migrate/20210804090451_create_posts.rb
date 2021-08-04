class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references   :user, index: true, foreign_key: true
      t.string :title
      t.string :content
      t.string :ip
      t.decimal :avg_rating, precision: 10, scale: 2, default: 0.0

      t.timestamps
    end
  end
end
