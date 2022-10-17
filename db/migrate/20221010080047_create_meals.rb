class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.string :image_id
      t.string :dish_name
      t.timestamps
    end
  end
end
