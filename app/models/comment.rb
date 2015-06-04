class Comment < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :post

  has_many :votes
  
  default_scope { order('created_at DESC') }

  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true

end
