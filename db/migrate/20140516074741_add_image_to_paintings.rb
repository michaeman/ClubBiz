class AddImageToPaintings < ActiveRecord::Migration
  def change
    add_column :societies, :image, :string
  end
end
