class ChangeEventsInfo < ActiveRecord::Migration
  def change
  	remove_column :events, :society, :string
  	add_column :events, :society_id, :integer

  end
end
