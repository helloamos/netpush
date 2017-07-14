class CreateMailBroadcastList < ActiveRecord::Migration[5.1]
  def change
    create_table :mail_broadcast_lists do |t|
    	t.string 	:name, null: false
    	t.text   	:description
    	t.integer   :contact_number, default: "0"
    	t.string 	:status, null: false
    	t.references :user, null: false

    	t.timestamps null: false
    end
  end
end
