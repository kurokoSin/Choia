require 'mechanize'

class EHon

class Scraper

  def get_publisher()
    agent = Mechanize.new
    page = agent.get('http://www.e-hon.ne.jp/bec/SI/ComicTop?taishongpi=NEW')

    p = Array.new(Publisher)
    
    # Loop: リンク
    page.links.each do |link|
      unless link.href.include?('ComicSyuppan')  then
        next
      end
      
      # link.text = 出版社名
      # link.href = URL
      p << Publisher.new( name => link.text, url => link.href )
    end

    return p
  end

  def get_books(publisher, url)
    agent = Machanize.new
    page = agent.get(url)
    
    # Loop: リンク
    page.links.each do |link|
      p link
    end
  end
end

class Publisher
  attr_accessor :name
  attr_accessor :url
end

class BookInfo
  attr_accessor :title
  attr_accessor :author
  attr_accessor :comic_name
  attr_accessor :publisher
  attr_accessor :release_date
end

end
