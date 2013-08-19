class Channel < ActiveRecord::Base
  belongs_to :user
  has_many :articles
  attr_accessible :name, :url, :user_id

  validates_presence_of :url, :name
  validate :url_rss_atom_valid?



  def url_rss_atom_valid?
    if url_rss_valid?(self.url) || url_atom_valid?(self.url)
      true
    else
      errors.add(:url, "url no valida")
      false
    end
  end

  def url_atom_valid?(html)
    matches |= html.scan(/<link.*href=['"]*([^\s'"]+)['"]*.*application\/atom\+xml.*>/)
    matches |= html.scan(/<link.*application\/atom\+xml.*href=['"]*([^\s'"]+)['"]*.*>/)
  end

  def url_rss_valid?(html)
    matches |= html.scan(/<link.*href=['"]*([^\s'"]+)['"]*.*application\/rss\+xml.*>/)
    matches |= html.scan(/<link.*application\/rss\+xml.*href=['"]*([^\s'"]+)['"]*.*>/)
  end

  def update_articles
    feed = Feedzirra::Feed.fetch_and_parse(self.url)
    unless feed.blank?
      feed.entries.each do |entry|
        add_article(entry)
      end
    end
  end

  def add_article(entry)
    unless Article.exists?(['title = ? and description = ?', entry.title, entry.summary ])
      self.articles.create!(
          :title        => entry.title,
          :description  => entry.summary,
          :link         => entry.url,
          :pubdate      => entry.published,
          :guid         => entry.id
      )
    end
  end
end
