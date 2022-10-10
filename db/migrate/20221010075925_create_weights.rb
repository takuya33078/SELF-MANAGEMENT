class CreateWeights < ActiveRecord::Migration[5.2]
  def change
    create_table :weights do |t|
      t.string :name
      t.integer :goal_weight
      t.integer :current_weight
      t.timestamps
    end
  end
end
