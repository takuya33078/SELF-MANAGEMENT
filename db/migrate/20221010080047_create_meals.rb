class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.integer :image_id
      t.integer :customer_id
      t.string :dish_name
      t.timestamps
    end
  end
end
