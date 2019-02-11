class RenameIngredientsColumnToRecipes < ActiveRecord::Migration[5.2]
  def change
    rename_column :recipes, :ingredients, :ingredient
  end
end
