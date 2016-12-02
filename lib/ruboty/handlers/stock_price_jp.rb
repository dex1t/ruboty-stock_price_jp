require "nokogiri"
require "open-uri"
require "ruboty"

module Ruboty
  module Handlers
    class StockPriceJp < Base
      on /stock_price (?<ticker>.*?)\z/, name: 'stock_price', description: 'Fetch stock price from Google Finance'

      def stock_price(message)
        url = "https://www.google.com/finance?q=#{message['ticker']}"

        charset = nil
        html = open(url) do |f|
          charset = f.charset
          f.read
        end
        page = Nokogiri::HTML.parse(html, nil, charset)

        price = page.css('meta[itemprop="price"]').first['content']
        company = page.css('meta[itemprop="name"]').first['content']
        change = page.css('meta[itemprop="priceChange"]').first['content']
        percent = page.css('meta[itemprop="priceChangePercent"]').first['content']
        emoji = case percent[0]
                when '+'
                  ':chart_with_upwards_trend:'
                when '-'
                  ':chart_with_downwards_trend:'
                end

        message.reply("*#{company}*: #{price} _#{change}(#{percent}%)_ #{emoji}")
      end
    end
  end
end
