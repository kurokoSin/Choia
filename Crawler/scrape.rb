require 'mechanize'
require './Property.rb'

class EHon

class Scraper

  def self.get_publisher()
    agent = Mechanize.new
    page = agent.get('http://www.e-hon.ne.jp/bec/SI/ComicTop?taishongpi=NEW')

    p = []
    
    # Loop:
    page.links.each do |link|
      unless link.href.include?('ComicSyuppan')  then
        next
      end
      
      # link.text =
      # link.href = URL
      p.push( Publisher.new do
	        name link.text
	        url  link.href 
              end	
	    )
    end

    return p
  end

  def self.get_books(publisher, url)
    sleep(1.5)
    agent = Mechanize.new
    page = agent.get(url)

    books = []
    
    # Loop:
    # at = %, search = /
    # page % table[2] = 7月期　出版社　コミック新刊案内
    elm = (page/:table)
    (elm[3]/:tr).each do |tr|
      books.push( BookInfo.new do
	                  title      (tr/:td[3]).text
	                  author     (tr/:td[4]).text
	                  comic_name (tr/:td).first.text
	                  publisher  publisher
                    release_date (tr/:td[1]).text
	          end
      )
    end

  end
end

class Publisher < Property
  
  property :name
  property :url 

end

class BookInfo < Property

  property :title
  property :author
  property :comic_name
  property :publisher
  property :release_date

end

end
