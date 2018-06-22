class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :addressess, dependent: :destroy 
  has_one :local_address, dependent: :destroy
  has_one :permanent_address, dependent: :destroy

  accepts_nested_attributes_for :permanent_address

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,         
         :confirmable

  mount_uploader :document, ImageUploader
  mount_uploader :profile_photo, ImageUploader

end
