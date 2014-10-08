class CreateSocietyevents < ActiveRecord::Migration
  def change
    create_table :societyevents do |t|
      t.integer :society_id
      t.integer :event_id

      t.timestamps
    end
  end
end
