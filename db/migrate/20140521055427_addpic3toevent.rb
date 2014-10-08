class Addpic3toevent < ActiveRecord::Migration
    def self.up
    add_attachment :events, :picture3
  end

  def self.down
    remove_attachment :events, :picture3
  end
end
