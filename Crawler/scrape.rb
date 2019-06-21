require 'mechanize'
require './Property.rb'

class EHon

class Scraper

  def self.get_publisher()
    agent = Mechanize.new
    page = agent.get('http://www.e-hon.ne.jp/bec/SI/ComicTop?taishongpi=NEW')

    p = Array.new(Publisher)
    
    # Loop:
    page.links.each do |link|
      unless link.href.include?('ComicSyuppan')  then
        next
      end
      
      # link.text =
      # link.href = URL
      p << Publisher.new( name => link.text, url => link.href )
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

class Publisher
  extend Property
  
  property :name
  property :url 

  def initialize(&block)
    case block.arity
      when 0 ; instance_eval &block
      else   ; yield self
    end if block
  end
end

class BookInfo
  extend Property

  property :title
  property :author
  property :comic_name
  property :publisher
  property :release_date

  def initialize(&block)
    case block.arity
      when 0 ; instance_eval &block
      else   ; yield self
    end if block
  end
end

end
