require '../co-worker/Property.rb'
require 'faraday'
require 'json'

class Chronicle

class Picker
  def self.get_serise()
    raws = get_comixes
    series = compress(raws)

  end

private

  def self.get_comixes()
    json_raw = Faraday.get('https://localhost:3000/comixes').body
    json = JSON.load(json_raw)
  end

  def self.compress( json )
    bks = []
    json.each do |one|
      # 前の文字と比較
        # 一致する部分がある場合、同じシリーズの本として一致部分をbksに貯め込む
        # 一致しない場合、違うシリーズとして新規にbksに貯め込む
    end
    bks
  end

end
end

# books = Scraper::Dnp.get_books
# books.each do |one|
#   p one
# end
