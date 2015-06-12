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
      #if user_id != favorite.user_id && favorite.user.email_favorites?
      if should_receive_update_for?(favorite)
         FavoriteMailer.new_comment(favorite.user, self.post, self).deliver_now
      end
    end
  end

  def should_receive_update_for?(favorite)
    user_id != favorite.user_id && favorite.user.email_favorites?
  end

end
