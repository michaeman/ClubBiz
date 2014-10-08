class CreateSocietynetworks < ActiveRecord::Migration
  def change
    create_table :societynetworks do |t|
      t.integer :society_id
      t.integer :network_id

      t.timestamps
    end
  end
end
