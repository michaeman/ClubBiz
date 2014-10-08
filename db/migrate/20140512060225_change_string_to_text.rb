class ChangeStringToText < ActiveRecord::Migration
  def change
  	remove_column :societies, :admin, :text
  	add_column :societies, :admin, :text
  end
end
