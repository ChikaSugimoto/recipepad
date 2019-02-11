class AddColumnDirections < ActiveRecord::Migration[5.2]
  def change
    add_column :directions, :image, :string
    add_column :directions, :comment, :string
  end
end
