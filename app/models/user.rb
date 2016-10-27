class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :image, UserImageUploader
  has_many :prototypes
  has_many :likes
  has_many :comments
end
