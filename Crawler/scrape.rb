require 'mechanize'
require './Property.rb'
require './dto.rb'

class Scraper

class EHon

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
    isheader = true
    elm = (page/:table)
    (elm[3]/:tr).each do |tr|
      if isheader then 
        isheader = false
        next
      end
      books.push( BookInfo.new do
	                  name         (tr/:font)[2].text
	                  author       (tr/:font)[3].text
	                  comic_name   (tr%:font).text
	                  publisher    publisher
                    publish_date (tr/:font)[1].text
                    is_adult     (! (tr/:img)[0].nil?).to_s
	                end
      )
    end

    books

  end
end


end
