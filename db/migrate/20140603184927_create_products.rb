class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.float :sale_price
      t.string :brand
      t.string :url
      t.string :image_url
      t.references :list, index: true

      t.timestamps
    end
  end
end
