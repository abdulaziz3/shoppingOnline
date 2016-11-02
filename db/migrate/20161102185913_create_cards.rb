class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :card_holder
      t.string :card_no
      t.integer :ccv_no
      t.date :exp_date
      t.integer :customer_id

      t.timestamps null: false
    end
  end
end
