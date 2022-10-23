class CreateWeights < ActiveRecord::Migration[5.2]
  def change
    create_table :weights do |t|
      t.integer :customer_id
      t.integer :weight_id
      t.integer :current_weight
      t.timestamps
    end
  end
end
