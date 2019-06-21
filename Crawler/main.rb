#!/opt/ruby/shims/ruby

require './scrape.rb'

s = EHon::Scraper

ps = s.get_publisher

p ps
