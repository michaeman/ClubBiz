class Addeventtofollow < ActiveRecord::Migration
  def change
  	add_column :follows, :event_id, :integer
  end
end
