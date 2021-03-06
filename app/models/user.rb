class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Relationship
  has_many :mail_broadcast_lists
  has_many :phone_broadcast_lists
  has_many :mail_lists
  has_many :phone_lists
  has_many :campaigns
end
