class AddFieldToComment < ActiveRecord::Migration
  def change

    add_column :comments, :society_id, :integer

  end
end
