class ModifyEvent < ActiveRecord::Migration
  def change
  	add_column :events, :society, :string
  end
end
