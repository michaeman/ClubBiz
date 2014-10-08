class AddAttachmentAvatarToSocieties < ActiveRecord::Migration
  def self.up
    change_table :societies do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :societies, :avatar
  end
end
