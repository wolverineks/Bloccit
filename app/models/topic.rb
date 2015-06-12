class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  
  scope :visible_to, -> (user) { user ? all : where(public: true) }

  scope :publicly_viewable, -> { where(public: true)  }

  scope :privately_viewable, -> { where(public: false) }

  mount_uploader :image, ImageUploader

  validates :name, length: { minimum: 5 }, presence: true

  self.per_page = 50

end
