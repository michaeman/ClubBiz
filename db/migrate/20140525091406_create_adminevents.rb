class CreateAdminevents < ActiveRecord::Migration
  def change
    create_table :adminevents do |t|
      t.integer :admin_id
      t.integer :event_id

      t.timestamps
    end
  end
end
