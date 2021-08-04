class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.references   :post, index: true, foreign_key: true
      t.references   :user, index: true, foreign_key: true
      t.decimal      :value, precision: 10, scale: 2, default: 0.0
      t.timestamps
    end
  end
end
