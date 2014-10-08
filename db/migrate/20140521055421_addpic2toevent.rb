class Addpic2toevent < ActiveRecord::Migration
  def self.up
    add_attachment :events, :picture2
  end

  def self.down
    remove_attachment :events, :picture2
  end
end
