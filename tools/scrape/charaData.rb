require 'open-uri'
require 'nokogiri'
require 'csv'

# スクレイピング先のURL
ssr_index_url = 'http://gbf-wiki.com/index.php?%BF%CD%CA%AASSR'
sr_index_url = 'http://gbf-wiki.com/index.php?%BF%CD%CA%AASR'
r_index_url = 'http://gbf-wiki.com/index.php?%BF%CD%CA%AAR'
urls = [r_index_url, sr_index_url, ssr_index_url]

def fetchPageHtml(url)
  charset = nil
  html = open(url) do |f|
    charset = f.charset # 文字種別を取得
    f.read # htmlを読み込んで変数htmlに渡す
  end
  # htmlをパース(解析)してオブジェクトを生成
  doc = Nokogiri::HTML.parse(html, nil, charset)
  return doc
end

def parseCharaData(doc)
  rows = []
  doc.css('table#sortabletable1 tr').each_with_index do |node, idx|

    img_node = node.css('td:nth-child(1) a')
    elm_node = node.css('td:nth-child(3) span')

    if !img_node.empty? && !elm_node.text.empty?
      chara_id = img_node.attribute('title').value.match(/^[0-9]*/)[0]

      name = node.css('td:nth-child(2) a').text

      match = name.slice!(/ \((S{,2}R)\)/)
      reality = match.to_s.scan(/S{,2}R/)[0]

      element = elm_node.text

      style = node.css('td:nth-child(4)').text
      race = node.css('td:nth-child(5)').text
      weapon = node.css('td:nth-child(6)').text

      row = [name, chara_id, race, reality, style, element, weapon]
      rows.push(row)
    end

  end

  rows
end

finger_print = today = DateTime.now.strftime("%Y%m%d%H%M%S")
file_name = "CharaData_#{finger_print}.csv"
cvs_path = File.join("./tmp/#{file_name}")

docs = []
urls.each do |url|
  doc = fetchPageHtml url
  docs.push doc
end

rows = []
docs.each do |doc|
  rows.concat parseCharaData doc
end

file = CSV.open(cvs_path, "w")
rows.each do |row|
  file.puts row
end

puts "...SUCCESS!"
puts cvs_path

