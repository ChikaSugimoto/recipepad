class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :recipe_id
      t.string :image
      t.string :comment

      t.timestamps
    end
  end
end
