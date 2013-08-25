class Comment < ActiveRecord::Base
  belongs_to :article
  attr_accessible :comment, :article, :article_id

  def user
    self.article.channel.user
  end

  def author
    self.user.username
  end

  def avatar
    self.user.avatar
  end
end
