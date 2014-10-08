class AddFieldsToSociety < ActiveRecord::Migration
  def change
    add_column :societies, :title, :string
    add_column :societies, :description, :text
    add_column :societies, :code, :integer
  end
end
