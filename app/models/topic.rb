class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :name, length: { minimum: 5 }, presence: true

  self.per_page = 50

end
