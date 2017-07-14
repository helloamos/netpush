class CreateAlterUser < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
    	t.string :full_name
    	t.string :company
    	t.string :address
    	t.string :phone
    	t.string :country
    	t.string :city
    end
  end
end
