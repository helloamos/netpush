class CreateCampaign < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
    	t.string :campaign_type
    	t.string :campaign_name
    	t.string :sender
    	t.string :recipient
    	t.string :object
    	t.text   :content
    	t.string :statut

    	t.timestamps null: false
    end
  end
end
