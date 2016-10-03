class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :prototype_thumbnails
  accepts_nested_attributes_for :prototype_thumbnails, reject_if: proc { |attributes| attributes['image'].blank? }
  validates_presence_of :title, :catchcopy, :concept
end
