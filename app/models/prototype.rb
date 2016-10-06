class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :prototype_thumbnails
  accepts_nested_attributes_for :prototype_thumbnails, reject_if: :reject_sub_images
  validates_presence_of :title, :catchcopy, :concept
end

def reject_sub_images(attributes)
  attributes['image'].blank?
end
