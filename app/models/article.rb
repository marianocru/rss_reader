class Article < ActiveRecord::Base
  belongs_to :channel
  has_many :comments
  attr_accessible :description, :link, :mark, :pubdate, :title, :guid

  def self.search(channel_id=nil, tittle=nil, summary=nil, user_id=nil)
    articles = where (['channel_id in (select id from channels where user_id = ? )', user_id] )
    articles = articles.where (['channel_id = ? ', channel_id]) unless channel_id.blank?
    articles = articles.where (['title like ?', "%#{tittle}%"]) unless tittle.blank?
    articles = articles.where (['description like ?', "%#{summary}%"]) unless summary.blank?
    articles = articles.order('pubdate desc')
    return articles
  end

end
