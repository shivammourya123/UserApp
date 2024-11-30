class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price
      t.text :description
      t.string :category
      t.string :image
      t.decimal :rating_rate
      t.integer :rating_count

      t.timestamps
    end
  end
end
