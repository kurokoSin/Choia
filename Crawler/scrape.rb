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
    agent = Machanize.new
    page = agent.get(url)
    
    # Loop:
    page.links.each do |link|
      p link
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
