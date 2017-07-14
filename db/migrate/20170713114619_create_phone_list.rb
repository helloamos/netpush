class CreatePhoneList < ActiveRecord::Migration[5.1]
  def change
    create_table :phone_lists do |t|
    	t.string :full_name
    	t.string :phone, null: false
    	t.string :city
    	t.string :country
    	t.string :email 
    	t.references :user, null: false

    	t.timestamps null: false
    end
  end
end
