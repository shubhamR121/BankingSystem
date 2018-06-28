class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :addressess, dependent: :destroy 
  has_one :local_address, dependent: :destroy
  has_one :permanent_address, dependent: :destroy
  has_one :account, dependent: :destroy
  has_and_belongs_to_many :beneficiaries
  has_many :transactions

  accepts_nested_attributes_for :permanent_address

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,         
         :confirmable

  mount_uploader :document, ImageUploader
  mount_uploader :profile_photo, ImageUploader


  after_create :generate_account_no

  def generate_account_no
    Account.create!(account_no:(SecureRandom.random_number(9e11) + 1e11).to_i, user_id: self.id)
  end
end