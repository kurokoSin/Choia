# gem install differ
require 'differ'

def diff(strs)
  strs.reduce do |s1, s2|
    diff = Differ.diff_by_char(s1,s2)
    raw = diff.send(:raw_array)
    (raw[0].is_a? String)? raw[0]: ''
  end
end

# 参考サイト
# [複数の文字列から同じ部分を抜き出す方法](https://ja.stackoverflow.com/questions/27617/%E8%A4%87%E6%95%B0%E3%81%AE%E6%96%87%E5%AD%97%E5%88%97%E3%81%8B%E3%82%89%E5%90%8C%E3%81%98%E9%83%A8%E5%88%86%E3%82%92%E6%8A%9C%E3%81%8D%E5%87%BA%E3%81%99%E6%96%B9%E6%B3%95)

