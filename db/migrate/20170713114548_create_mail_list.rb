class CreateMailList < ActiveRecord::Migration[5.1]
  def change
    create_table :mail_lists do |t|
    	t.string :full_name
    	t.string :phone
    	t.string :city
    	t.string :country
    	t.string :email, null: false
    	t.references :user, null: false

    	t.timestamps null: false
    end
  end
end
