require 'mechanize'
require './Property.rb'
require './dto.rb'

class Scraper

class Kadokawa
  def self.get_books()
    infos = get_month
    bks = []
    infos.each do |link|
      info = get_info(link.url) 
      p info
      bks.push( info )
    end
    bks
  end

private

  def self.get_month()
    agent = Mechanize.new
    page = agent.get('https://www.kadokawa.co.jp/calendar/?target=0&largeGenre=13')

    pg = []
    # Loop:
    page.links.each do |link|
      next unless link.href.match?("https.*product")
      pg.push(
        Publisher.new do
          name link.text
          url  link.href 
        end	
	    )
    end
    return pg
  end

  def self.get_info(url)
    sleep(1.3)
    p url
    agent = Mechanize.new
    page = agent.get(url)
    # Loop:
    # at = %, search = /
    # page % table[2] = 7月期　出版社　コミック新刊案内
    BookInfo.new do
	    name         page.at('h1#book-title').inner_text 
	    author       '' # parse_auth( page.at('ul.book-auther-pc') )
	    comic_name   'ＫＡＤＯＫＡＷＡ'
	    publisher    'ＫＡＤＯＫＡＷＡ'
      publish_date page.at('dd.detail-release-text').inner_text.sub(/年/,'-').sub(/月/,'-').sub(/日/,'')
      is_adult     false
	  end
  end

  def self.parse_auth(auther_html)
    elm = auther_html.search('li')
    auther = elm[0].at('a').inner_text 
    # elm.each do |li|
    #   # 著者 -> 画
    #   # 原作 -> 作
    #   # キャラクター原案 -> キャラクター原案
    #   elm.
    # end
  end

  def self.parse_label(label_site)
    # bslogcomic.com -> ビーズログ・コミックス
    # web-ace.jp -> ｗｅｂエース・コミックス
    # 無印       -> PIXIV?

    
  end
end


end
