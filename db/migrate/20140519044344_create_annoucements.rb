class CreateAnnoucements < ActiveRecord::Migration
  def change
    create_table :annoucements do |t|
      t.text :contents
      t.integer :event_id
      t.integer :society_id

      t.timestamps
    end
  end
end
