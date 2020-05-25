#!/opt/ruby/shims/ruby

require './scrape.rb'
require './register.rb'

s = Scraper::EHon
reg = Register

ps = s.get_publisher

ps.each do |pub| 
  # bks = s.get_books(pub.name, pub.url)
  bks = s.get_pages(pub.name, pub.url)
  bks.each do |book|
    reg.reg_book(book)
  end
end 
