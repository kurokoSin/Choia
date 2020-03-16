def narrow_to_wide(str)
  str.tr('0-9a-zA-Z.: ', '０-９ａ-ｚＡ-Ｚ．：　')
end

def wide_to_narrow(str)
  str.tr('０-９ａ-ｚＡ-Ｚ．：　', '0-9a-zA-Z.: ')
end
