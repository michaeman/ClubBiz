class AddReserveToEvent < ActiveRecord::Migration
  def change
  	add_column :events, :reserve_amount, :integer
  end
end
