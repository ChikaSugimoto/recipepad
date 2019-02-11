class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.string :name
      t.string :main_image
      t.string :ingredients
      t.string :description
      t.string :situation
      t.string :point

      t.timestamps
    end
  end
end
