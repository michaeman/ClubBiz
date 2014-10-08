class RemoveSocietyId < ActiveRecord::Migration
  def change
  	remove_column :societies, :society_id, :integer
  end
end
