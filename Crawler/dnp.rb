#!/opt/ruby/shims/ruby

require './scrape_dnp.rb'
require './register.rb'

s = Scraper::Dnp
reg = Register

books = s.get_books

books.each do |book| 
  reg.reg_book(book)
end 
