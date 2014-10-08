class CreateJoinTableUserSociety < ActiveRecord::Migration
  def change
    create_join_table :users, :societies do |t|
      # t.index [:user_id, :society_id]
      # t.index [:society_id, :user_id]
    end
  end
end
