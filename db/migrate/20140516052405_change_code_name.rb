class ChangeCodeName < ActiveRecord::Migration
  def change
  	remove_column :societies, :code, :integer
  	add_column :societies, :validation_code, :integer
  end
end
