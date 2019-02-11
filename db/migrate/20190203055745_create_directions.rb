class CreateDirections < ActiveRecord::Migration[5.2]
  def change
    create_table :directions do |t|
      t.integer :recipe_id
      t.integer :number

      t.timestamps
    end
  end
end
