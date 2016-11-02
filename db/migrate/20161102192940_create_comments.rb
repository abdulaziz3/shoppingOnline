class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :cantent
      t.integer :customer_id
      t.integer :product_id
      t.integer :star

      t.timestamps null: false
    end
  end
end
