class Campaign < ApplicationRecord
	belongs_to :user
	# Constants.
	CAMPAIGNS_TYPE = [["Campagne de SMS "], ["Campagne d'email"]]
 
end