class Addpic1toevent < ActiveRecord::Migration
   def self.up
    add_attachment :events, :picture1
  end

  def self.down
    remove_attachment :events, :picture1
  end
end
