class SocietyLogo < ActiveRecord::Migration
  def change
  	add_column :societies, :logo, :text
  	add_column :societies, :email_address, :string
  	add_column :societies, :contact_number, :integer


  end
end
