class Comment < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :post

  has_many :votes
  
  default_scope { order('created_at DESC') }

  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true

  after_create :send_favorite_emails

  private

  def send_favorite_emails
    post.favorites.each do |favorite|
      FavoriteMailer.new_comment(favorite.user, post, self).deliver_now unless favorite.user == user
    end
  end


end
