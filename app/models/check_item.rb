class CheckItem < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { maximum: 50 }
  validates :price_min, numericality: { only_integer: true }
  validates :price_max, numericality: { only_integer: true }

  def check
    result = []
    fetch_items_by(name).each do |item|
      url = fetch_url_from(item)
      price = fetch_price_from(item)
      result << { name: name, price: price, url: url } if within_range?(price)
    end
    result
  end

  private

  # 商品名で検索
  def fetch_items_by(item_name)
    request_url = "https://www.mercari.com/jp/search/?keyword=#{item_name}"
    html = open(URI.encode(request_url))
    Nokogiri::HTML.parse(html).css('.items-box')
  end

  # 商品からURLを取得する
  def fetch_url_from(item)
    item.css('a').attr('href')
  end

  # 商品から価格を取得する
  def fetch_price_from(item)
    convert_price(item.css('.items-box-price').text)
  end

  # 価格を変換
  # ex. "¥ 7,777" => 7777
  def convert_price(price)
    price.slice(2..-1).delete(',').to_i
  end

  # 設定金額の範囲内か
  def within_range?(price)
    price_min <= price && price <= price_max
  end
end
