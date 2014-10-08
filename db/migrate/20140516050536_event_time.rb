class EventTime < ActiveRecord::Migration
  def change

  	add_column :events, :start_time, :datetime
  	add_column :events, :end_time, :datetime
  	add_column :events, :max_tickets, :integer
  	add_column :events, :ticket_price, :integer

  	add_column :events, :location_address, :string
  	add_column :events, :post_code, :integer
  	

  end
end
