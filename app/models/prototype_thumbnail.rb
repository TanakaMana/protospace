class PrototypeThumbnail < ActiveRecord::Base
  belongs_to :prototype
  validates :image, :state, presence: true
  mount_uploader :image, ImageUploader
  enum state: { main: 0, sub: 1 }
end
