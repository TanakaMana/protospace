class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :prototype_thumbnails
  accepts_nested_attributes_for :prototype_thumbnails, reject_if: :reject_sub_images
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates_presence_of :title, :catchcopy, :concept

  def reject_sub_images(attributes)
  attributes['image'].blank?
  end

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
