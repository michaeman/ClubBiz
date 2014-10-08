class FixSocietyInfo < ActiveRecord::Migration
  def change
  	remove_column :societies, :admin, :text
  end
end
