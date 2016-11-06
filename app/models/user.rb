class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :name
  mount_uploader :image, UserImageUploader
  has_many :prototypes
  has_many :likes
  has_many :comments
end
