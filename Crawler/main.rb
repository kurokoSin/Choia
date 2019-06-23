#!/opt/ruby/shims/ruby

require './scrape.rb'

s = EHon::Scraper

ps = s.get_publisher
ps.each do |pub| 
  bks = s.get_books(pub.name, pub.url)
  bks.each do |book|
    p "-------------------------"
    # p book
    book.each do |el|
      p el
    end
    # p book.title
    # p book.author
    # p book.release_date
    # p book.publisher
    # p book.comic_name   
    
  end
  exit
end 
