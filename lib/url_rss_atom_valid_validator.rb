class UrlRssAtomValidValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless url_rss_valid?(value) || url_atom_valid?(value)
      object.errors[attribute] << (options[:message] || "is not formatted properly")
    end
  end

def url_rss_atom_valid?(html)
  matches |= html.scan(/<link.*href=['"]*([^\s'"]+)['"]*.*application\/atom\+xml.*>/)
  matches |= html.scan(/<link.*application\/atom\+xml.*href=['"]*([^\s'"]+)['"]*.*>/)
end

def url_rss_atom_valid?(html)
  matches |= html.scan(/<link.*href=['"]*([^\s'"]+)['"]*.*application\/rss\+xml.*>/)
  matches |= html.scan(/<link.*application\/rss\+xml.*href=['"]*([^\s'"]+)['"]*.*>/)

  #  matches |= rss_feed

end

end