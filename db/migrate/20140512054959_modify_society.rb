class ModifySociety < ActiveRecord::Migration
  def change
  	add_column :societies, :name, :string
  	add_column :societies, :admin, :string
  end
end
