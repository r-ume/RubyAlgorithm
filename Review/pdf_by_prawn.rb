begin
  require 'rubygems'
  require 'prawn'
rescue LoadError
end

FONT_TITLE = 'ipamp.ttf'
PDF_FILE  = 'prawn_pdf_1.pdf'

Prawn::Document.generate(PDF_FILE, page_size: 'A4', page_layout: :portrait, left_margin: 20, right_margin: 20) do

  # フォント指定
  font "ipamp.ttf"

  # オプション指定無しでテキスト出力
  text("Hello, Prawn World!!" * 10)

  # 下へ20px移動
  move_down 20

  # 中央揃え、フォントサイズ27px
  text "中央揃え", align: :center, size: 72

  move_down 10

  # このような書き方もできる
  font_size(36) do
    text "nested" * 10
  end

  # 頁内の左下からXY座標を指定可能
  draw_text 'Welcome in Prawn!', at: [100,250]
  draw_text 'Welcome in Prawn!', at: [150,200]

  # オプション指定無しでテキスト出力
  text "RubyでPDF! " * 180

  move_down 50

  # 罫線
  stroke_horizontal_rule

  # 3回ループ
  3.times do |i|
    text "-" * 89
    text "  #{i} Loop"
  end

  # 下へ10px移動
  move_down 10

  # 罫線
  stroke_horizontal_rule

end

