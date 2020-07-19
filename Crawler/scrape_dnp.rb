require 'nokogiri'
require 'faraday'
require './Property.rb'
require './dto.rb'

class Scraper

class Dnp
  def self.get_books()
    rows = get_schedule
    bks = []
    rows.each do |one|
      book = get_info(one) 
      next if book.nil?
      bks.push( book )
    end
    bks
  end

private

  def self.get_schedule()
    site = Faraday.get('https://honto.jp/netstore/calender/old.html').body
    # site = Faraday.get('https://honto.jp/netstore/calender.html').body
    noko = Nokogiri::HTML(site)
    # Loop:
    tbodys = noko.search('tr')
  end

  def self.get_info(one)
    return nil if one.xpath("td").empty?
    pub_date = correct_date(one.xpath("td")[0].text.sub(/月/,'-').sub(/日/,'')) 
    BookInfo.new do
	    name         one.xpath("td")[1].text
	    author       one.xpath("td")[2].text
	    comic_name   one.xpath("td")[3].text
	    publisher    one.xpath("td")[4].text
      publish_date pub_date
      is_adult     :false
      source_domain "honto.jp"
	  end
  end

  # hontoサイトには年が入らないので補正をかける
  # 12月に来月（1月）を取得すると過去の１月になりそうなので。
  def self.correct_date(rawdate)
    raw_arr = rawdate.split('-')
    nd = Time.new
    nd.since(1.years) if raw_arr[0].to_i < nd.month 
    "#{nd.year}-#{rawdate}" 
  end

end
end

# books = Scraper::Dnp.get_books
# books.each do |one|
#   p one
# end
