#!/opt/ruby/shims/ruby

require './scrape_kadokawa.rb'
require './register.rb'

s = Scraper::Kadokawa
reg = Register

books = s.get_books

books.each do |book| 
  reg.reg_book(book)
end 
