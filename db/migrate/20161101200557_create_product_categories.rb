class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      t.integer :product_id
      t.integer :catigory_id

      t.timestamps null: false
    end
  end
end
